import 'package:test/test.dart';
import 'package:serverpod_test_client/serverpod_test_client.dart';
import 'package:serverpod_service_client/serverpod_service_client.dart' as service;
import 'package:serverpod_client/src/auth_key_manager.dart';

Future<void> setupTestData(Client client) async {
  await client.basicDatabase.deleteAllSimpleTestData();
  await client.basicDatabase.createSimpleTestData(100);
}

void main() {
  var client = Client('http://localhost:8080/');
  var serviceClient = service.Client(
      'https://localhost:8081/',
      authenticationKeyManager: ServiceKeyManager('0', 'password'),
  );

  group('Logging', () {
    test('Set runtime settings', () async {
      // Log everything
      var settings = service.RuntimeSettings(
        logAllCalls: true,
        logSlowCalls: true,
        logFailedCalls: false,
        logAllQueries: true,
        logSlowQueries: true,
        logFailedQueries: true,
        logMalformedCalls: true,
        slowCallDuration: 1.0,
        slowQueryDuration: 1.0,
        logLevel: service.LogLevel.debug.index,
      );

      await serviceClient.insights.setRuntimeSettings(settings);

      settings = await serviceClient.insights.getRuntimeSettings();
      expect(settings.logFailedCalls, equals(false));

      settings.logFailedCalls = true;
      await serviceClient.insights.setRuntimeSettings(settings);
      settings = await serviceClient.insights.getRuntimeSettings();
      expect(settings.logFailedCalls, equals(true));
    });

    test('Clear logs', () async {
      // Make sure there is at least 10 log entries
      for (int i = 0; i < 10; i += 1) {
        await client.logging.logInfo('Log test $i');
      }

      service.SessionLogResult logResult = await serviceClient.insights.getSessionLog(10);
      expect(logResult.sessionLog.length, equals(10));

      await serviceClient.insights.clearAllLogs();

      logResult = await serviceClient.insights.getSessionLog(10);
      // Expect 1 entry as the clean logs call will be logged
      expect(logResult.sessionLog.length, equals(1));
    });

    test('Log entry', () async {
      await client.logging.logInfo('test');

      var logResult = await serviceClient.insights.getSessionLog(1);
      expect(logResult.sessionLog.length, equals(1));

      expect(logResult.sessionLog[0].messageLog.length, equals(1));
      expect(logResult.sessionLog[0].messageLog[0].message, equals('test'));
    });

    test('All log levels', () async {
      await client.logging.logDebugAndInfoAndError('debug', 'info', 'error');

      // Writing of logs may still be going on after the call has returned,
      // wait a second to make sure the log has been flushed to the database
      await Future.delayed(Duration(seconds: 1));

      var logResult = await serviceClient.insights.getSessionLog(1);
      expect(logResult.sessionLog.length, equals(1));

      expect(logResult.sessionLog[0].messageLog.length, equals(3));
      expect(logResult.sessionLog[0].messageLog[0].message, equals('debug'));
      expect(logResult.sessionLog[0].messageLog[1].message, equals('info'));
      expect(logResult.sessionLog[0].messageLog[2].message, equals('error'));
    });

    test('Error log level', () async {
      // Set log level to error
      var settings = service.RuntimeSettings(
        logAllCalls: true,
        logSlowCalls: true,
        logFailedCalls: true,
        logAllQueries: true,
        logSlowQueries: true,
        logFailedQueries: true,
        logMalformedCalls: true,
        slowCallDuration: 1.0,
        slowQueryDuration: 1.0,
        logLevel: service.LogLevel.error.index,
      );
      await serviceClient.insights.setRuntimeSettings(settings);

      await client.logging.logDebugAndInfoAndError('debug', 'info', 'error');

      // Writing of logs may still be going on after the call has returned,
      // wait a second to make sure the log has been flushed to the database
      await Future.delayed(Duration(seconds: 1));

      var logResult = await serviceClient.insights.getSessionLog(1);
      expect(logResult.sessionLog.length, equals(1));

      // Debug and info logs should be ignored
      expect(logResult.sessionLog[0].messageLog.length, equals(1));
      expect(logResult.sessionLog[0].messageLog[0].message, equals('error'));
    });

    test('Query log', () async {
      await client.logging.twoQueries();

      // Writing of logs may still be going on after the call has returned,
      // wait a second to make sure the log has been flushed to the database
      await Future.delayed(Duration(seconds: 1));

      var logResult = await serviceClient.insights.getSessionLog(1);
      expect(logResult.sessionLog.length, equals(1));

      expect(logResult.sessionLog[0].queries.length, equals(2));
    });

    test('Transaction query log', () async {
      await setupTestData(client);
      await client.transactionsDatabase.updateInsertDelete(50, 500, 0);
      await Future.delayed(Duration(seconds: 1));

      var logResult = await serviceClient.insights.getSessionLog(1);
      expect(logResult.sessionLog.length, equals(1));

      expect(logResult.sessionLog[0].queries.length, equals(2));
      expect(logResult.sessionLog[0].queries[1].query.startsWith('BEGIN'), equals(true));
    });

    test('Disabled logging', () async {
      await client.logging.logInfo('test');
      await Future.delayed(Duration(seconds: 1));

      var logResult = await serviceClient.insights.getSessionLog(1);
      expect(logResult.sessionLog.length, equals(1));
      expect(logResult.sessionLog[0].sessionLogEntry.endpoint, equals('logging'));
      expect(logResult.sessionLog[0].sessionLogEntry.method, equals('logInfo'));

      await client.logging.logInfo('test');
      await Future.delayed(Duration(seconds: 1));
      await client.loggingDisabled.logInfo('test');
      await Future.delayed(Duration(seconds: 1));

      logResult = await serviceClient.insights.getSessionLog(1);
      expect(logResult.sessionLog.length, equals(1));
      expect(logResult.sessionLog[0].sessionLogEntry.endpoint, equals('logging'));
      expect(logResult.sessionLog[0].sessionLogEntry.method, equals('logInfo'));
    });

    test('Future call logging', () async {
      // Set log level to info
      var settings = service.RuntimeSettings(
        logAllCalls: true,
        logSlowCalls: true,
        logFailedCalls: true,
        logAllQueries: true,
        logSlowQueries: true,
        logFailedQueries: true,
        logMalformedCalls: true,
        slowCallDuration: 1.0,
        slowQueryDuration: 1.0,
        logLevel: service.LogLevel.info.index,
      );
      await serviceClient.insights.setRuntimeSettings(settings);

      await client.futureCalls.makeFutureCall(SimpleData(num: 42));

      // Make sure that the future call has been executed (it's set for 1 s)
      await Future.delayed(Duration(seconds: 3));

      var logResult = await serviceClient.insights.getSessionLog(1);
      expect(logResult.sessionLog.length, equals(1));

      expect(logResult.sessionLog[0].messageLog.length, equals(1));
      expect(logResult.sessionLog[0].messageLog[0].message, equals('42'));
      expect(logResult.sessionLog[0].sessionLogEntry.futureCall, equals('testCall'));
    });
  });
}



class ServiceKeyManager extends AuthenticationKeyManager {
  final String name;
  final String serviceSecret;

  ServiceKeyManager(this.name, this.serviceSecret);

  Future<String> get() async {
    return 'name:$serviceSecret';
  }
  Future<Null> put(String key) async {
  }
}