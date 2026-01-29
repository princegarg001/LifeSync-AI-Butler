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
import 'task.dart' as _i2;
import 'package:my_project_client/src/protocol/protocol.dart' as _i3;

/// AI Chat response DTO
abstract class AiChatResponse implements _i1.SerializableModel {
  AiChatResponse._({
    required this.message,
    this.intentType,
    this.suggestedActions,
    this.createdTask,
    this.error,
  });

  factory AiChatResponse({
    required String message,
    String? intentType,
    List<String>? suggestedActions,
    _i2.Task? createdTask,
    String? error,
  }) = _AiChatResponseImpl;

  factory AiChatResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return AiChatResponse(
      message: jsonSerialization['message'] as String,
      intentType: jsonSerialization['intentType'] as String?,
      suggestedActions: jsonSerialization['suggestedActions'] == null
          ? null
          : _i3.Protocol().deserialize<List<String>>(
              jsonSerialization['suggestedActions'],
            ),
      createdTask: jsonSerialization['createdTask'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.Task>(
              jsonSerialization['createdTask'],
            ),
      error: jsonSerialization['error'] as String?,
    );
  }

  String message;

  String? intentType;

  List<String>? suggestedActions;

  _i2.Task? createdTask;

  String? error;

  /// Returns a shallow copy of this [AiChatResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AiChatResponse copyWith({
    String? message,
    String? intentType,
    List<String>? suggestedActions,
    _i2.Task? createdTask,
    String? error,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AiChatResponse',
      'message': message,
      if (intentType != null) 'intentType': intentType,
      if (suggestedActions != null)
        'suggestedActions': suggestedActions?.toJson(),
      if (createdTask != null) 'createdTask': createdTask?.toJson(),
      if (error != null) 'error': error,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AiChatResponseImpl extends AiChatResponse {
  _AiChatResponseImpl({
    required String message,
    String? intentType,
    List<String>? suggestedActions,
    _i2.Task? createdTask,
    String? error,
  }) : super._(
         message: message,
         intentType: intentType,
         suggestedActions: suggestedActions,
         createdTask: createdTask,
         error: error,
       );

  /// Returns a shallow copy of this [AiChatResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AiChatResponse copyWith({
    String? message,
    Object? intentType = _Undefined,
    Object? suggestedActions = _Undefined,
    Object? createdTask = _Undefined,
    Object? error = _Undefined,
  }) {
    return AiChatResponse(
      message: message ?? this.message,
      intentType: intentType is String? ? intentType : this.intentType,
      suggestedActions: suggestedActions is List<String>?
          ? suggestedActions
          : this.suggestedActions?.map((e0) => e0).toList(),
      createdTask: createdTask is _i2.Task?
          ? createdTask
          : this.createdTask?.copyWith(),
      error: error is String? ? error : this.error,
    );
  }
}
