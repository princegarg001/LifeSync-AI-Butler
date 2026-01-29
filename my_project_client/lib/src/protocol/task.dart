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
import 'package:serverpod_client/serverpod_client.dart' as _i1;

/// Task model for LifeSync AI Butler - Task/Todo management
abstract class Task implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
