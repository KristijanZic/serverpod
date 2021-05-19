import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';

class FutureCallsEndpoint extends Endpoint {
  Future<void> makeFutureCall(Session session, SimpleData? data) async {
    print('makeFutureCall');
    session.server.futureCallWithDelay('testCall', data, Duration(seconds: 1));
  }
}