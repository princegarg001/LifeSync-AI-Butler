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
import 'insight.dart' as _i2;
import 'task.dart' as _i3;
import 'package:my_project_client/src/protocol/protocol.dart' as _i4;

/// Dashboard data transfer object (DTO) - Not stored in database
abstract class DashboardData implements _i1.SerializableModel {
  DashboardData._({
    required this.userName,
    required this.greeting,
    required this.todayTaskCount,
    required this.completedTodayCount,
    required this.upcomingTaskCount,
    required this.overdueTaskCount,
    required this.productivityScore,
    required this.currentStreak,
    required this.recentInsights,
    required this.upcomingTasks,
  });

  factory DashboardData({
    required String userName,
    required String greeting,
    required int todayTaskCount,
    required int completedTodayCount,
    required int upcomingTaskCount,
    required int overdueTaskCount,
    required int productivityScore,
    required int currentStreak,
    required List<_i2.Insight> recentInsights,
    required List<_i3.Task> upcomingTasks,
  }) = _DashboardDataImpl;

  factory DashboardData.fromJson(Map<String, dynamic> jsonSerialization) {
    return DashboardData(
      userName: jsonSerialization['userName'] as String,
      greeting: jsonSerialization['greeting'] as String,
      todayTaskCount: jsonSerialization['todayTaskCount'] as int,
      completedTodayCount: jsonSerialization['completedTodayCount'] as int,
      upcomingTaskCount: jsonSerialization['upcomingTaskCount'] as int,
      overdueTaskCount: jsonSerialization['overdueTaskCount'] as int,
      productivityScore: jsonSerialization['productivityScore'] as int,
      currentStreak: jsonSerialization['currentStreak'] as int,
      recentInsights: _i4.Protocol().deserialize<List<_i2.Insight>>(
        jsonSerialization['recentInsights'],
      ),
      upcomingTasks: _i4.Protocol().deserialize<List<_i3.Task>>(
        jsonSerialization['upcomingTasks'],
      ),
    );
  }

  String userName;

  String greeting;

  int todayTaskCount;

  int completedTodayCount;

  int upcomingTaskCount;

  int overdueTaskCount;

  int productivityScore;

  int currentStreak;

  List<_i2.Insight> recentInsights;

  List<_i3.Task> upcomingTasks;

  /// Returns a shallow copy of this [DashboardData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DashboardData copyWith({
    String? userName,
    String? greeting,
    int? todayTaskCount,
    int? completedTodayCount,
    int? upcomingTaskCount,
    int? overdueTaskCount,
    int? productivityScore,
    int? currentStreak,
    List<_i2.Insight>? recentInsights,
    List<_i3.Task>? upcomingTasks,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DashboardData',
      'userName': userName,
      'greeting': greeting,
      'todayTaskCount': todayTaskCount,
      'completedTodayCount': completedTodayCount,
      'upcomingTaskCount': upcomingTaskCount,
      'overdueTaskCount': overdueTaskCount,
      'productivityScore': productivityScore,
      'currentStreak': currentStreak,
      'recentInsights': recentInsights.toJson(valueToJson: (v) => v.toJson()),
      'upcomingTasks': upcomingTasks.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DashboardDataImpl extends DashboardData {
  _DashboardDataImpl({
    required String userName,
    required String greeting,
    required int todayTaskCount,
    required int completedTodayCount,
    required int upcomingTaskCount,
    required int overdueTaskCount,
    required int productivityScore,
    required int currentStreak,
    required List<_i2.Insight> recentInsights,
    required List<_i3.Task> upcomingTasks,
  }) : super._(
         userName: userName,
         greeting: greeting,
         todayTaskCount: todayTaskCount,
         completedTodayCount: completedTodayCount,
         upcomingTaskCount: upcomingTaskCount,
         overdueTaskCount: overdueTaskCount,
         productivityScore: productivityScore,
         currentStreak: currentStreak,
         recentInsights: recentInsights,
         upcomingTasks: upcomingTasks,
       );

  /// Returns a shallow copy of this [DashboardData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DashboardData copyWith({
    String? userName,
    String? greeting,
    int? todayTaskCount,
    int? completedTodayCount,
    int? upcomingTaskCount,
    int? overdueTaskCount,
    int? productivityScore,
    int? currentStreak,
    List<_i2.Insight>? recentInsights,
    List<_i3.Task>? upcomingTasks,
  }) {
    return DashboardData(
      userName: userName ?? this.userName,
      greeting: greeting ?? this.greeting,
      todayTaskCount: todayTaskCount ?? this.todayTaskCount,
      completedTodayCount: completedTodayCount ?? this.completedTodayCount,
      upcomingTaskCount: upcomingTaskCount ?? this.upcomingTaskCount,
      overdueTaskCount: overdueTaskCount ?? this.overdueTaskCount,
      productivityScore: productivityScore ?? this.productivityScore,
      currentStreak: currentStreak ?? this.currentStreak,
      recentInsights:
          recentInsights ??
          this.recentInsights.map((e0) => e0.copyWith()).toList(),
      upcomingTasks:
          upcomingTasks ??
          this.upcomingTasks.map((e0) => e0.copyWith()).toList(),
    );
  }
}
