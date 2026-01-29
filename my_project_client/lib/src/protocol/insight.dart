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

/// AI-generated insights and predictions
abstract class Insight implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
