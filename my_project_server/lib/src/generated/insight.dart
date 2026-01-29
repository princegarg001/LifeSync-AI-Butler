/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

/// AI-generated insights and predictions
abstract class Insight
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Insight._({
    this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.message,
    int? priority,
    this.iconName,
    this.actionType,
    this.actionData,
    bool? isDismissed,
    this.expiresAt,
    required this.generatedAt,
  }) : priority = priority ?? 0,
       isDismissed = isDismissed ?? false;

  factory Insight({
    int? id,
    required int userId,
    required String type,
    required String title,
    required String message,
    int? priority,
    String? iconName,
    String? actionType,
    String? actionData,
    bool? isDismissed,
    DateTime? expiresAt,
    required DateTime generatedAt,
  }) = _InsightImpl;

  factory Insight.fromJson(Map<String, dynamic> jsonSerialization) {
    return Insight(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      type: jsonSerialization['type'] as String,
      title: jsonSerialization['title'] as String,
      message: jsonSerialization['message'] as String,
      priority: jsonSerialization['priority'] as int?,
      iconName: jsonSerialization['iconName'] as String?,
      actionType: jsonSerialization['actionType'] as String?,
      actionData: jsonSerialization['actionData'] as String?,
      isDismissed: jsonSerialization['isDismissed'] as bool?,
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
      generatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['generatedAt'],
      ),
    );
  }

  static final t = InsightTable();

  static const db = InsightRepository._();

  @override
  int? id;

  int userId;

  String type;

  String title;

  String message;

  int priority;

  String? iconName;

  String? actionType;

  String? actionData;

  bool isDismissed;

  DateTime? expiresAt;

  DateTime generatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Insight]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Insight copyWith({
    int? id,
    int? userId,
    String? type,
    String? title,
    String? message,
    int? priority,
    String? iconName,
    String? actionType,
    String? actionData,
    bool? isDismissed,
    DateTime? expiresAt,
    DateTime? generatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Insight',
      if (id != null) 'id': id,
      'userId': userId,
      'type': type,
      'title': title,
      'message': message,
      'priority': priority,
      if (iconName != null) 'iconName': iconName,
      if (actionType != null) 'actionType': actionType,
      if (actionData != null) 'actionData': actionData,
      'isDismissed': isDismissed,
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      'generatedAt': generatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Insight',
      if (id != null) 'id': id,
      'userId': userId,
      'type': type,
      'title': title,
      'message': message,
      'priority': priority,
      if (iconName != null) 'iconName': iconName,
      if (actionType != null) 'actionType': actionType,
      if (actionData != null) 'actionData': actionData,
      'isDismissed': isDismissed,
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      'generatedAt': generatedAt.toJson(),
    };
  }

  static InsightInclude include() {
    return InsightInclude._();
  }

  static InsightIncludeList includeList({
    _i1.WhereExpressionBuilder<InsightTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<InsightTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InsightTable>? orderByList,
    InsightInclude? include,
  }) {
    return InsightIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Insight.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Insight.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _InsightImpl extends Insight {
  _InsightImpl({
    int? id,
    required int userId,
    required String type,
    required String title,
    required String message,
    int? priority,
    String? iconName,
    String? actionType,
    String? actionData,
    bool? isDismissed,
    DateTime? expiresAt,
    required DateTime generatedAt,
  }) : super._(
         id: id,
         userId: userId,
         type: type,
         title: title,
         message: message,
         priority: priority,
         iconName: iconName,
         actionType: actionType,
         actionData: actionData,
         isDismissed: isDismissed,
         expiresAt: expiresAt,
         generatedAt: generatedAt,
       );

  /// Returns a shallow copy of this [Insight]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Insight copyWith({
    Object? id = _Undefined,
    int? userId,
    String? type,
    String? title,
    String? message,
    int? priority,
    Object? iconName = _Undefined,
    Object? actionType = _Undefined,
    Object? actionData = _Undefined,
    bool? isDismissed,
    Object? expiresAt = _Undefined,
    DateTime? generatedAt,
  }) {
    return Insight(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      title: title ?? this.title,
      message: message ?? this.message,
      priority: priority ?? this.priority,
      iconName: iconName is String? ? iconName : this.iconName,
      actionType: actionType is String? ? actionType : this.actionType,
      actionData: actionData is String? ? actionData : this.actionData,
      isDismissed: isDismissed ?? this.isDismissed,
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
      generatedAt: generatedAt ?? this.generatedAt,
    );
  }
}

class InsightUpdateTable extends _i1.UpdateTable<InsightTable> {
  InsightUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<String, String> type(String value) => _i1.ColumnValue(
    table.type,
    value,
  );

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> message(String value) => _i1.ColumnValue(
    table.message,
    value,
  );

  _i1.ColumnValue<int, int> priority(int value) => _i1.ColumnValue(
    table.priority,
    value,
  );

  _i1.ColumnValue<String, String> iconName(String? value) => _i1.ColumnValue(
    table.iconName,
    value,
  );

  _i1.ColumnValue<String, String> actionType(String? value) => _i1.ColumnValue(
    table.actionType,
    value,
  );

  _i1.ColumnValue<String, String> actionData(String? value) => _i1.ColumnValue(
    table.actionData,
    value,
  );

  _i1.ColumnValue<bool, bool> isDismissed(bool value) => _i1.ColumnValue(
    table.isDismissed,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> expiresAt(DateTime? value) =>
      _i1.ColumnValue(
        table.expiresAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> generatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.generatedAt,
        value,
      );
}

class InsightTable extends _i1.Table<int?> {
  InsightTable({super.tableRelation}) : super(tableName: 'insights') {
    updateTable = InsightUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    type = _i1.ColumnString(
      'type',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    message = _i1.ColumnString(
      'message',
      this,
    );
    priority = _i1.ColumnInt(
      'priority',
      this,
      hasDefault: true,
    );
    iconName = _i1.ColumnString(
      'iconName',
      this,
    );
    actionType = _i1.ColumnString(
      'actionType',
      this,
    );
    actionData = _i1.ColumnString(
      'actionData',
      this,
    );
    isDismissed = _i1.ColumnBool(
      'isDismissed',
      this,
      hasDefault: true,
    );
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
    generatedAt = _i1.ColumnDateTime(
      'generatedAt',
      this,
    );
  }

  late final InsightUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString type;

  late final _i1.ColumnString title;

  late final _i1.ColumnString message;

  late final _i1.ColumnInt priority;

  late final _i1.ColumnString iconName;

  late final _i1.ColumnString actionType;

  late final _i1.ColumnString actionData;

  late final _i1.ColumnBool isDismissed;

  late final _i1.ColumnDateTime expiresAt;

  late final _i1.ColumnDateTime generatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    type,
    title,
    message,
    priority,
    iconName,
    actionType,
    actionData,
    isDismissed,
    expiresAt,
    generatedAt,
  ];
}

class InsightInclude extends _i1.IncludeObject {
  InsightInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Insight.t;
}

class InsightIncludeList extends _i1.IncludeList {
  InsightIncludeList._({
    _i1.WhereExpressionBuilder<InsightTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Insight.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Insight.t;
}

class InsightRepository {
  const InsightRepository._();

  /// Returns a list of [Insight]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Insight>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InsightTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<InsightTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InsightTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Insight>(
      where: where?.call(Insight.t),
      orderBy: orderBy?.call(Insight.t),
      orderByList: orderByList?.call(Insight.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Insight] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Insight?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InsightTable>? where,
    int? offset,
    _i1.OrderByBuilder<InsightTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InsightTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Insight>(
      where: where?.call(Insight.t),
      orderBy: orderBy?.call(Insight.t),
      orderByList: orderByList?.call(Insight.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Insight] by its [id] or null if no such row exists.
  Future<Insight?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Insight>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Insight]s in the list and returns the inserted rows.
  ///
  /// The returned [Insight]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Insight>> insert(
    _i1.Session session,
    List<Insight> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Insight>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Insight] and returns the inserted row.
  ///
  /// The returned [Insight] will have its `id` field set.
  Future<Insight> insertRow(
    _i1.Session session,
    Insight row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Insight>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Insight]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Insight>> update(
    _i1.Session session,
    List<Insight> rows, {
    _i1.ColumnSelections<InsightTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Insight>(
      rows,
      columns: columns?.call(Insight.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Insight]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Insight> updateRow(
    _i1.Session session,
    Insight row, {
    _i1.ColumnSelections<InsightTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Insight>(
      row,
      columns: columns?.call(Insight.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Insight] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Insight?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<InsightUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Insight>(
      id,
      columnValues: columnValues(Insight.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Insight]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Insight>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<InsightUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<InsightTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<InsightTable>? orderBy,
    _i1.OrderByListBuilder<InsightTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Insight>(
      columnValues: columnValues(Insight.t.updateTable),
      where: where(Insight.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Insight.t),
      orderByList: orderByList?.call(Insight.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Insight]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Insight>> delete(
    _i1.Session session,
    List<Insight> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Insight>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Insight].
  Future<Insight> deleteRow(
    _i1.Session session,
    Insight row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Insight>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Insight>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<InsightTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Insight>(
      where: where(Insight.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InsightTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Insight>(
      where: where?.call(Insight.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
