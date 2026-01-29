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

/// Task model for LifeSync AI Butler - Task/Todo management
abstract class Task implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Task._({
    this.id,
    required this.userId,
    required this.title,
    this.description,
    this.dueDate,
    String? priority,
    String? status,
    this.category,
    bool? isRecurring,
    this.recurrenceRule,
    this.reminderAt,
    this.completedAt,
    bool? aiSuggested,
    required this.createdAt,
  }) : priority = priority ?? '\'medium\'',
       status = status ?? '\'pending\'',
       isRecurring = isRecurring ?? false,
       aiSuggested = aiSuggested ?? false;

  factory Task({
    int? id,
    required int userId,
    required String title,
    String? description,
    DateTime? dueDate,
    String? priority,
    String? status,
    String? category,
    bool? isRecurring,
    String? recurrenceRule,
    DateTime? reminderAt,
    DateTime? completedAt,
    bool? aiSuggested,
    required DateTime createdAt,
  }) = _TaskImpl;

  factory Task.fromJson(Map<String, dynamic> jsonSerialization) {
    return Task(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String?,
      dueDate: jsonSerialization['dueDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dueDate']),
      priority: jsonSerialization['priority'] as String?,
      status: jsonSerialization['status'] as String?,
      category: jsonSerialization['category'] as String?,
      isRecurring: jsonSerialization['isRecurring'] as bool?,
      recurrenceRule: jsonSerialization['recurrenceRule'] as String?,
      reminderAt: jsonSerialization['reminderAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['reminderAt']),
      completedAt: jsonSerialization['completedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['completedAt'],
            ),
      aiSuggested: jsonSerialization['aiSuggested'] as bool?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = TaskTable();

  static const db = TaskRepository._();

  @override
  int? id;

  int userId;

  String title;

  String? description;

  DateTime? dueDate;

  String priority;

  String status;

  String? category;

  bool isRecurring;

  String? recurrenceRule;

  DateTime? reminderAt;

  DateTime? completedAt;

  bool aiSuggested;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Task]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Task copyWith({
    int? id,
    int? userId,
    String? title,
    String? description,
    DateTime? dueDate,
    String? priority,
    String? status,
    String? category,
    bool? isRecurring,
    String? recurrenceRule,
    DateTime? reminderAt,
    DateTime? completedAt,
    bool? aiSuggested,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Task',
      if (id != null) 'id': id,
      'userId': userId,
      'title': title,
      if (description != null) 'description': description,
      if (dueDate != null) 'dueDate': dueDate?.toJson(),
      'priority': priority,
      'status': status,
      if (category != null) 'category': category,
      'isRecurring': isRecurring,
      if (recurrenceRule != null) 'recurrenceRule': recurrenceRule,
      if (reminderAt != null) 'reminderAt': reminderAt?.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      'aiSuggested': aiSuggested,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Task',
      if (id != null) 'id': id,
      'userId': userId,
      'title': title,
      if (description != null) 'description': description,
      if (dueDate != null) 'dueDate': dueDate?.toJson(),
      'priority': priority,
      'status': status,
      if (category != null) 'category': category,
      'isRecurring': isRecurring,
      if (recurrenceRule != null) 'recurrenceRule': recurrenceRule,
      if (reminderAt != null) 'reminderAt': reminderAt?.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      'aiSuggested': aiSuggested,
      'createdAt': createdAt.toJson(),
    };
  }

  static TaskInclude include() {
    return TaskInclude._();
  }

  static TaskIncludeList includeList({
    _i1.WhereExpressionBuilder<TaskTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TaskTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TaskTable>? orderByList,
    TaskInclude? include,
  }) {
    return TaskIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Task.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Task.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TaskImpl extends Task {
  _TaskImpl({
    int? id,
    required int userId,
    required String title,
    String? description,
    DateTime? dueDate,
    String? priority,
    String? status,
    String? category,
    bool? isRecurring,
    String? recurrenceRule,
    DateTime? reminderAt,
    DateTime? completedAt,
    bool? aiSuggested,
    required DateTime createdAt,
  }) : super._(
         id: id,
         userId: userId,
         title: title,
         description: description,
         dueDate: dueDate,
         priority: priority,
         status: status,
         category: category,
         isRecurring: isRecurring,
         recurrenceRule: recurrenceRule,
         reminderAt: reminderAt,
         completedAt: completedAt,
         aiSuggested: aiSuggested,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Task]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Task copyWith({
    Object? id = _Undefined,
    int? userId,
    String? title,
    Object? description = _Undefined,
    Object? dueDate = _Undefined,
    String? priority,
    String? status,
    Object? category = _Undefined,
    bool? isRecurring,
    Object? recurrenceRule = _Undefined,
    Object? reminderAt = _Undefined,
    Object? completedAt = _Undefined,
    bool? aiSuggested,
    DateTime? createdAt,
  }) {
    return Task(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description is String? ? description : this.description,
      dueDate: dueDate is DateTime? ? dueDate : this.dueDate,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      category: category is String? ? category : this.category,
      isRecurring: isRecurring ?? this.isRecurring,
      recurrenceRule: recurrenceRule is String?
          ? recurrenceRule
          : this.recurrenceRule,
      reminderAt: reminderAt is DateTime? ? reminderAt : this.reminderAt,
      completedAt: completedAt is DateTime? ? completedAt : this.completedAt,
      aiSuggested: aiSuggested ?? this.aiSuggested,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class TaskUpdateTable extends _i1.UpdateTable<TaskTable> {
  TaskUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> dueDate(DateTime? value) =>
      _i1.ColumnValue(
        table.dueDate,
        value,
      );

  _i1.ColumnValue<String, String> priority(String value) => _i1.ColumnValue(
    table.priority,
    value,
  );

  _i1.ColumnValue<String, String> status(String value) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<String, String> category(String? value) => _i1.ColumnValue(
    table.category,
    value,
  );

  _i1.ColumnValue<bool, bool> isRecurring(bool value) => _i1.ColumnValue(
    table.isRecurring,
    value,
  );

  _i1.ColumnValue<String, String> recurrenceRule(String? value) =>
      _i1.ColumnValue(
        table.recurrenceRule,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> reminderAt(DateTime? value) =>
      _i1.ColumnValue(
        table.reminderAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> completedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.completedAt,
        value,
      );

  _i1.ColumnValue<bool, bool> aiSuggested(bool value) => _i1.ColumnValue(
    table.aiSuggested,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class TaskTable extends _i1.Table<int?> {
  TaskTable({super.tableRelation}) : super(tableName: 'tasks') {
    updateTable = TaskUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    dueDate = _i1.ColumnDateTime(
      'dueDate',
      this,
    );
    priority = _i1.ColumnString(
      'priority',
      this,
      hasDefault: true,
    );
    status = _i1.ColumnString(
      'status',
      this,
      hasDefault: true,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
    isRecurring = _i1.ColumnBool(
      'isRecurring',
      this,
      hasDefault: true,
    );
    recurrenceRule = _i1.ColumnString(
      'recurrenceRule',
      this,
    );
    reminderAt = _i1.ColumnDateTime(
      'reminderAt',
      this,
    );
    completedAt = _i1.ColumnDateTime(
      'completedAt',
      this,
    );
    aiSuggested = _i1.ColumnBool(
      'aiSuggested',
      this,
      hasDefault: true,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final TaskUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnDateTime dueDate;

  late final _i1.ColumnString priority;

  late final _i1.ColumnString status;

  late final _i1.ColumnString category;

  late final _i1.ColumnBool isRecurring;

  late final _i1.ColumnString recurrenceRule;

  late final _i1.ColumnDateTime reminderAt;

  late final _i1.ColumnDateTime completedAt;

  late final _i1.ColumnBool aiSuggested;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    title,
    description,
    dueDate,
    priority,
    status,
    category,
    isRecurring,
    recurrenceRule,
    reminderAt,
    completedAt,
    aiSuggested,
    createdAt,
  ];
}

class TaskInclude extends _i1.IncludeObject {
  TaskInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Task.t;
}

class TaskIncludeList extends _i1.IncludeList {
  TaskIncludeList._({
    _i1.WhereExpressionBuilder<TaskTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Task.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Task.t;
}

class TaskRepository {
  const TaskRepository._();

  /// Returns a list of [Task]s matching the given query parameters.
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
  Future<List<Task>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TaskTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TaskTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TaskTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Task>(
      where: where?.call(Task.t),
      orderBy: orderBy?.call(Task.t),
      orderByList: orderByList?.call(Task.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Task] matching the given query parameters.
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
  Future<Task?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TaskTable>? where,
    int? offset,
    _i1.OrderByBuilder<TaskTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TaskTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Task>(
      where: where?.call(Task.t),
      orderBy: orderBy?.call(Task.t),
      orderByList: orderByList?.call(Task.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Task] by its [id] or null if no such row exists.
  Future<Task?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Task>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Task]s in the list and returns the inserted rows.
  ///
  /// The returned [Task]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Task>> insert(
    _i1.Session session,
    List<Task> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Task>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Task] and returns the inserted row.
  ///
  /// The returned [Task] will have its `id` field set.
  Future<Task> insertRow(
    _i1.Session session,
    Task row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Task>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Task]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Task>> update(
    _i1.Session session,
    List<Task> rows, {
    _i1.ColumnSelections<TaskTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Task>(
      rows,
      columns: columns?.call(Task.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Task]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Task> updateRow(
    _i1.Session session,
    Task row, {
    _i1.ColumnSelections<TaskTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Task>(
      row,
      columns: columns?.call(Task.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Task] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Task?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<TaskUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Task>(
      id,
      columnValues: columnValues(Task.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Task]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Task>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TaskUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TaskTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TaskTable>? orderBy,
    _i1.OrderByListBuilder<TaskTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Task>(
      columnValues: columnValues(Task.t.updateTable),
      where: where(Task.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Task.t),
      orderByList: orderByList?.call(Task.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Task]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Task>> delete(
    _i1.Session session,
    List<Task> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Task>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Task].
  Future<Task> deleteRow(
    _i1.Session session,
    Task row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Task>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Task>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TaskTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Task>(
      where: where(Task.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TaskTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Task>(
      where: where?.call(Task.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
