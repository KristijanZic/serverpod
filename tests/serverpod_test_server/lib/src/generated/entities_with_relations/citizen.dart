/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../protocol.dart' as _i2;

abstract class Citizen extends _i1.TableRow {
  Citizen._({
    int? id,
    required this.name,
    this.address,
    required this.companyId,
    this.company,
    this.oldCompanyId,
    this.oldCompany,
  }) : super(id);

  factory Citizen({
    int? id,
    required String name,
    _i2.Address? address,
    required int companyId,
    _i2.Company? company,
    int? oldCompanyId,
    _i2.Company? oldCompany,
  }) = _CitizenImpl;

  factory Citizen.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Citizen(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      address: serializationManager
          .deserialize<_i2.Address?>(jsonSerialization['address']),
      companyId:
          serializationManager.deserialize<int>(jsonSerialization['companyId']),
      company: serializationManager
          .deserialize<_i2.Company?>(jsonSerialization['company']),
      oldCompanyId: serializationManager
          .deserialize<int?>(jsonSerialization['oldCompanyId']),
      oldCompany: serializationManager
          .deserialize<_i2.Company?>(jsonSerialization['oldCompany']),
    );
  }

  static final t = CitizenTable();

  static const db = CitizenRepository._();

  String name;

  _i2.Address? address;

  int companyId;

  _i2.Company? company;

  int? oldCompanyId;

  _i2.Company? oldCompany;

  int? _companyEmployeesCompanyId;

  @override
  _i1.Table get table => t;

  Citizen copyWith({
    int? id,
    String? name,
    _i2.Address? address,
    int? companyId,
    _i2.Company? company,
    int? oldCompanyId,
    _i2.Company? oldCompany,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'companyId': companyId,
      'company': company,
      'oldCompanyId': oldCompanyId,
      'oldCompany': oldCompany,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'name': name,
      'companyId': companyId,
      'oldCompanyId': oldCompanyId,
      '_companyEmployeesCompanyId': _companyEmployeesCompanyId,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'companyId': companyId,
      'company': company,
      'oldCompanyId': oldCompanyId,
      'oldCompany': oldCompany,
      '_companyEmployeesCompanyId': _companyEmployeesCompanyId,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'name':
        name = value;
        return;
      case 'companyId':
        companyId = value;
        return;
      case 'oldCompanyId':
        oldCompanyId = value;
        return;
      case '_companyEmployeesCompanyId':
        _companyEmployeesCompanyId = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<Citizen>> find(
    _i1.Session session, {
    CitizenExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    CitizenInclude? include,
  }) async {
    return session.db.find<Citizen>(
      where: where != null ? where(Citizen.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findRow instead.')
  static Future<Citizen?> findSingleRow(
    _i1.Session session, {
    CitizenExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    CitizenInclude? include,
  }) async {
    return session.db.findSingleRow<Citizen>(
      where: where != null ? where(Citizen.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<Citizen?> findById(
    _i1.Session session,
    int id, {
    CitizenInclude? include,
  }) async {
    return session.db.findById<Citizen>(
      id,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required CitizenExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Citizen>(
      where: where(Citizen.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    Citizen row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.update instead.')
  static Future<bool> update(
    _i1.Session session,
    Citizen row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  @Deprecated(
      'Will be removed in 2.0.0. Use: db.insert instead. Important note: In db.insert, the object you pass in is no longer modified, instead a new copy with the added row is returned which contains the inserted id.')
  static Future<void> insert(
    _i1.Session session,
    Citizen row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.count instead.')
  static Future<int> count(
    _i1.Session session, {
    CitizenExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Citizen>(
      where: where != null ? where(Citizen.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static CitizenInclude include({
    _i2.AddressInclude? address,
    _i2.CompanyInclude? company,
    _i2.CompanyInclude? oldCompany,
  }) {
    return CitizenInclude._(
      address: address,
      company: company,
      oldCompany: oldCompany,
    );
  }
}

class _Undefined {}

class _CitizenImpl extends Citizen {
  _CitizenImpl({
    int? id,
    required String name,
    _i2.Address? address,
    required int companyId,
    _i2.Company? company,
    int? oldCompanyId,
    _i2.Company? oldCompany,
  }) : super._(
          id: id,
          name: name,
          address: address,
          companyId: companyId,
          company: company,
          oldCompanyId: oldCompanyId,
          oldCompany: oldCompany,
        );

  @override
  Citizen copyWith({
    Object? id = _Undefined,
    String? name,
    Object? address = _Undefined,
    int? companyId,
    Object? company = _Undefined,
    Object? oldCompanyId = _Undefined,
    Object? oldCompany = _Undefined,
  }) {
    return Citizen(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      address: address is _i2.Address? ? address : this.address?.copyWith(),
      companyId: companyId ?? this.companyId,
      company: company is _i2.Company? ? company : this.company?.copyWith(),
      oldCompanyId: oldCompanyId is int? ? oldCompanyId : this.oldCompanyId,
      oldCompany:
          oldCompany is _i2.Company? ? oldCompany : this.oldCompany?.copyWith(),
    );
  }
}

typedef CitizenExpressionBuilder = _i1.Expression Function(CitizenTable);

class CitizenTable extends _i1.Table {
  CitizenTable({
    super.queryPrefix,
    super.tableRelations,
  }) : super(tableName: 'citizen') {
    name = _i1.ColumnString(
      'name',
      queryPrefix: super.queryPrefix,
      tableRelations: super.tableRelations,
    );
    companyId = _i1.ColumnInt(
      'companyId',
      queryPrefix: super.queryPrefix,
      tableRelations: super.tableRelations,
    );
    oldCompanyId = _i1.ColumnInt(
      'oldCompanyId',
      queryPrefix: super.queryPrefix,
      tableRelations: super.tableRelations,
    );
    $_companyEmployeesCompanyId = _i1.ColumnInt(
      '_companyEmployeesCompanyId',
      queryPrefix: super.queryPrefix,
      tableRelations: super.tableRelations,
    );
  }

  late final _i1.ColumnString name;

  _i2.AddressTable? _address;

  late final _i1.ColumnInt companyId;

  _i2.CompanyTable? _company;

  late final _i1.ColumnInt oldCompanyId;

  _i2.CompanyTable? _oldCompany;

  late final _i1.ColumnInt $_companyEmployeesCompanyId;

  _i2.AddressTable get address {
    if (_address != null) return _address!;
    _address = _i1.createRelationTable(
      queryPrefix: queryPrefix,
      fieldName: 'address',
      foreignTableName: _i2.Address.t.tableName,
      column: id,
      foreignColumnName: _i2.Address.t.inhabitantId.columnName,
      createTable: (
        relationQueryPrefix,
        foreignTableRelation,
      ) =>
          _i2.AddressTable(
        queryPrefix: relationQueryPrefix,
        tableRelations: [
          ...?tableRelations,
          foreignTableRelation,
        ],
      ),
    );
    return _address!;
  }

  _i2.CompanyTable get company {
    if (_company != null) return _company!;
    _company = _i1.createRelationTable(
      queryPrefix: queryPrefix,
      fieldName: 'company',
      foreignTableName: _i2.Company.t.tableName,
      column: companyId,
      foreignColumnName: _i2.Company.t.id.columnName,
      createTable: (
        relationQueryPrefix,
        foreignTableRelation,
      ) =>
          _i2.CompanyTable(
        queryPrefix: relationQueryPrefix,
        tableRelations: [
          ...?tableRelations,
          foreignTableRelation,
        ],
      ),
    );
    return _company!;
  }

  _i2.CompanyTable get oldCompany {
    if (_oldCompany != null) return _oldCompany!;
    _oldCompany = _i1.createRelationTable(
      queryPrefix: queryPrefix,
      fieldName: 'oldCompany',
      foreignTableName: _i2.Company.t.tableName,
      column: oldCompanyId,
      foreignColumnName: _i2.Company.t.id.columnName,
      createTable: (
        relationQueryPrefix,
        foreignTableRelation,
      ) =>
          _i2.CompanyTable(
        queryPrefix: relationQueryPrefix,
        tableRelations: [
          ...?tableRelations,
          foreignTableRelation,
        ],
      ),
    );
    return _oldCompany!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        companyId,
        oldCompanyId,
        $_companyEmployeesCompanyId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'address') {
      return address;
    }
    if (relationField == 'company') {
      return company;
    }
    if (relationField == 'oldCompany') {
      return oldCompany;
    }
    return null;
  }
}

@Deprecated('Use CitizenTable.t instead.')
CitizenTable tCitizen = CitizenTable();

class CitizenInclude extends _i1.Include {
  CitizenInclude._({
    _i2.AddressInclude? address,
    _i2.CompanyInclude? company,
    _i2.CompanyInclude? oldCompany,
  }) {
    _address = address;
    _company = company;
    _oldCompany = oldCompany;
  }

  _i2.AddressInclude? _address;

  _i2.CompanyInclude? _company;

  _i2.CompanyInclude? _oldCompany;

  @override
  Map<String, _i1.Include?> get includes => {
        'address': _address,
        'company': _company,
        'oldCompany': _oldCompany,
      };

  @override
  _i1.Table get table => Citizen.t;
}

class CitizenRepository {
  const CitizenRepository._();

  final attachRow = const CitizenAttachRowRepository._();

  final detachRow = const CitizenDetachRowRepository._();

  Future<List<Citizen>> find(
    _i1.Session session, {
    CitizenExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    List<_i1.Order>? orderByList,
    _i1.Transaction? transaction,
    CitizenInclude? include,
  }) async {
    return session.dbNext.find<Citizen>(
      where: where?.call(Citizen.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      transaction: transaction,
      include: include,
    );
  }

  Future<Citizen?> findRow(
    _i1.Session session, {
    CitizenExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    _i1.Transaction? transaction,
    CitizenInclude? include,
  }) async {
    return session.dbNext.findRow<Citizen>(
      where: where?.call(Citizen.t),
      transaction: transaction,
      include: include,
    );
  }

  Future<Citizen?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CitizenInclude? include,
  }) async {
    return session.dbNext.findById<Citizen>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Citizen>> insert(
    _i1.Session session,
    List<Citizen> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<Citizen>(
      rows,
      transaction: transaction,
    );
  }

  Future<Citizen> insertRow(
    _i1.Session session,
    Citizen row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<Citizen>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Citizen>> update(
    _i1.Session session,
    List<Citizen> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<Citizen>(
      rows,
      transaction: transaction,
    );
  }

  Future<Citizen> updateRow(
    _i1.Session session,
    Citizen row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<Citizen>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<Citizen> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<Citizen>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    Citizen row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<Citizen>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required CitizenExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<Citizen>(
      where: where(Citizen.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    CitizenExpressionBuilder? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<Citizen>(
      where: where?.call(Citizen.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CitizenAttachRowRepository {
  const CitizenAttachRowRepository._();

  Future<void> address(
    _i1.Session session,
    Citizen citizen,
    _i2.Address address,
  ) async {
    if (address.id == null) {
      throw ArgumentError.notNull('address.id');
    }
    if (citizen.id == null) {
      throw ArgumentError.notNull('citizen.id');
    }

    var $address = address.copyWith(inhabitantId: citizen.id);
    await session.dbNext.updateRow<_i2.Address>(
      $address,
      columns: [_i2.Address.t.inhabitantId],
    );
  }

  Future<void> company(
    _i1.Session session,
    Citizen citizen,
    _i2.Company company,
  ) async {
    if (citizen.id == null) {
      throw ArgumentError.notNull('citizen.id');
    }
    if (company.id == null) {
      throw ArgumentError.notNull('company.id');
    }

    var $citizen = citizen.copyWith(companyId: company.id);
    await session.dbNext.updateRow<Citizen>(
      $citizen,
      columns: [Citizen.t.companyId],
    );
  }

  Future<void> oldCompany(
    _i1.Session session,
    Citizen citizen,
    _i2.Company oldCompany,
  ) async {
    if (citizen.id == null) {
      throw ArgumentError.notNull('citizen.id');
    }
    if (oldCompany.id == null) {
      throw ArgumentError.notNull('oldCompany.id');
    }

    var $citizen = citizen.copyWith(oldCompanyId: oldCompany.id);
    await session.dbNext.updateRow<Citizen>(
      $citizen,
      columns: [Citizen.t.oldCompanyId],
    );
  }
}

class CitizenDetachRowRepository {
  const CitizenDetachRowRepository._();

  Future<void> address(
    _i1.Session session,
    Citizen citizen,
  ) async {
    var $address = citizen.address;

    if ($address == null) {
      throw ArgumentError.notNull('citizen.address');
    }
    if ($address.id == null) {
      throw ArgumentError.notNull('citizen.address.id');
    }
    if (citizen.id == null) {
      throw ArgumentError.notNull('citizen.id');
    }

    var $$address = $address.copyWith(inhabitantId: null);
    await session.dbNext.updateRow<_i2.Address>(
      $$address,
      columns: [_i2.Address.t.inhabitantId],
    );
  }

  Future<void> oldCompany(
    _i1.Session session,
    Citizen citizen,
  ) async {
    if (citizen.id == null) {
      throw ArgumentError.notNull('citizen.id');
    }

    var $citizen = citizen.copyWith(oldCompanyId: null);
    await session.dbNext.updateRow<Citizen>(
      $citizen,
      columns: [Citizen.t.oldCompanyId],
    );
  }
}