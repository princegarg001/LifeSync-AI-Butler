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

/// This file defines the User model for LifeSync AI Butler
abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.email,
    required this.name,
    this.avatarUrl,
    String? timezone,
    bool? notificationsEnabled,
    this.lastActiveAt,
    required this.createdAt,
  }) : timezone = timezone ?? '\'UTC\'',
       notificationsEnabled = notificationsEnabled ?? true;

  factory User({
    int? id,
    required String email,
    required String name,
    String? avatarUrl,
    String? timezone,
    bool? notificationsEnabled,
    DateTime? lastActiveAt,
    required DateTime createdAt,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      email: jsonSerialization['email'] as String,
      name: jsonSerialization['name'] as String,
      avatarUrl: jsonSerialization['avatarUrl'] as String?,
      timezone: jsonSerialization['timezone'] as String?,
      notificationsEnabled: jsonSerialization['notificationsEnabled'] as bool?,
      lastActiveAt: jsonSerialization['lastActiveAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastActiveAt'],
            ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String email;

  String name;

  String? avatarUrl;

  String? timezone;

  bool? notificationsEnabled;

  DateTime? lastActiveAt;

  DateTime createdAt;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  User copyWith({
    int? id,
    String? email,
    String? name,
    String? avatarUrl,
    String? timezone,
    bool? notificationsEnabled,
    DateTime? lastActiveAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'User',
      if (id != null) 'id': id,
      'email': email,
      'name': name,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      if (timezone != null) 'timezone': timezone,
      if (notificationsEnabled != null)
        'notificationsEnabled': notificationsEnabled,
      if (lastActiveAt != null) 'lastActiveAt': lastActiveAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String email,
    required String name,
    String? avatarUrl,
    String? timezone,
    bool? notificationsEnabled,
    DateTime? lastActiveAt,
    required DateTime createdAt,
  }) : super._(
         id: id,
         email: email,
         name: name,
         avatarUrl: avatarUrl,
         timezone: timezone,
         notificationsEnabled: notificationsEnabled,
         lastActiveAt: lastActiveAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  User copyWith({
    Object? id = _Undefined,
    String? email,
    String? name,
    Object? avatarUrl = _Undefined,
    Object? timezone = _Undefined,
    Object? notificationsEnabled = _Undefined,
    Object? lastActiveAt = _Undefined,
    DateTime? createdAt,
  }) {
    return User(
      id: id is int? ? id : this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      avatarUrl: avatarUrl is String? ? avatarUrl : this.avatarUrl,
      timezone: timezone is String? ? timezone : this.timezone,
      notificationsEnabled: notificationsEnabled is bool?
          ? notificationsEnabled
          : this.notificationsEnabled,
      lastActiveAt: lastActiveAt is DateTime?
          ? lastActiveAt
          : this.lastActiveAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
