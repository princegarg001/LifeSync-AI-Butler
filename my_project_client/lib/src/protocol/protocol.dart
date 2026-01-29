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
import 'ai_chat_response.dart' as _i2;
import 'chat_message.dart' as _i3;
import 'dashboard_data.dart' as _i4;
import 'greetings/greeting.dart' as _i5;
import 'insight.dart' as _i6;
import 'task.dart' as _i7;
import 'user.dart' as _i8;
import 'package:my_project_client/src/protocol/chat_message.dart' as _i9;
import 'package:my_project_client/src/protocol/insight.dart' as _i10;
import 'package:my_project_client/src/protocol/task.dart' as _i11;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i12;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i13;
export 'ai_chat_response.dart';
export 'chat_message.dart';
export 'dashboard_data.dart';
export 'greetings/greeting.dart';
export 'insight.dart';
export 'task.dart';
export 'user.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.AiChatResponse) {
      return _i2.AiChatResponse.fromJson(data) as T;
    }
    if (t == _i3.ChatMessage) {
      return _i3.ChatMessage.fromJson(data) as T;
    }
    if (t == _i4.DashboardData) {
      return _i4.DashboardData.fromJson(data) as T;
    }
    if (t == _i5.Greeting) {
      return _i5.Greeting.fromJson(data) as T;
    }
    if (t == _i6.Insight) {
      return _i6.Insight.fromJson(data) as T;
    }
    if (t == _i7.Task) {
      return _i7.Task.fromJson(data) as T;
    }
    if (t == _i8.User) {
      return _i8.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AiChatResponse?>()) {
      return (data != null ? _i2.AiChatResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.ChatMessage?>()) {
      return (data != null ? _i3.ChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.DashboardData?>()) {
      return (data != null ? _i4.DashboardData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Greeting?>()) {
      return (data != null ? _i5.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Insight?>()) {
      return (data != null ? _i6.Insight.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Task?>()) {
      return (data != null ? _i7.Task.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.User?>()) {
      return (data != null ? _i8.User.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<String>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i6.Insight>) {
      return (data as List).map((e) => deserialize<_i6.Insight>(e)).toList()
          as T;
    }
    if (t == List<_i7.Task>) {
      return (data as List).map((e) => deserialize<_i7.Task>(e)).toList() as T;
    }
    if (t == List<_i9.ChatMessage>) {
      return (data as List).map((e) => deserialize<_i9.ChatMessage>(e)).toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i10.Insight>) {
      return (data as List).map((e) => deserialize<_i10.Insight>(e)).toList()
          as T;
    }
    if (t == List<_i11.Task>) {
      return (data as List).map((e) => deserialize<_i11.Task>(e)).toList() as T;
    }
    try {
      return _i12.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i13.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.AiChatResponse => 'AiChatResponse',
      _i3.ChatMessage => 'ChatMessage',
      _i4.DashboardData => 'DashboardData',
      _i5.Greeting => 'Greeting',
      _i6.Insight => 'Insight',
      _i7.Task => 'Task',
      _i8.User => 'User',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('my_project.', '');
    }

    switch (data) {
      case _i2.AiChatResponse():
        return 'AiChatResponse';
      case _i3.ChatMessage():
        return 'ChatMessage';
      case _i4.DashboardData():
        return 'DashboardData';
      case _i5.Greeting():
        return 'Greeting';
      case _i6.Insight():
        return 'Insight';
      case _i7.Task():
        return 'Task';
      case _i8.User():
        return 'User';
    }
    className = _i12.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i13.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'AiChatResponse') {
      return deserialize<_i2.AiChatResponse>(data['data']);
    }
    if (dataClassName == 'ChatMessage') {
      return deserialize<_i3.ChatMessage>(data['data']);
    }
    if (dataClassName == 'DashboardData') {
      return deserialize<_i4.DashboardData>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i5.Greeting>(data['data']);
    }
    if (dataClassName == 'Insight') {
      return deserialize<_i6.Insight>(data['data']);
    }
    if (dataClassName == 'Task') {
      return deserialize<_i7.Task>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i8.User>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i12.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i13.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i12.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i13.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
