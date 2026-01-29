import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// DashboardEndpoint provides aggregated data for the main dashboard.
class DashboardEndpoint extends Endpoint {
  /// Get complete dashboard data for a user
  Future<DashboardData> getDashboardData(
    Session session,
    int userId,
    String userName,
  ) async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    // Get today's tasks
    final todayTasks = await Task.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          t.dueDate.notEquals(null) &
          (t.dueDate >= startOfDay) &
          (t.dueDate < endOfDay),
    );

    final completedToday = todayTasks
        .where((t) => t.status == 'completed')
        .length;

    // Get upcoming tasks
    final weekFromNow = now.add(const Duration(days: 7));
    final upcomingTasks = await Task.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          t.status.notEquals('completed') &
          t.status.notEquals('cancelled') &
          t.dueDate.notEquals(null) &
          (t.dueDate >= now) &
          (t.dueDate <= weekFromNow),
      orderBy: (t) => t.dueDate,
      limit: 5,
    );

    // Get overdue count
    final overdueCount = await Task.db.count(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          t.status.notEquals('completed') &
          t.status.notEquals('cancelled') &
          t.dueDate.notEquals(null) &
          (t.dueDate < now),
    );

    // Get active insights
    final insights = await Insight.db.find(
      session,
      where: (i) => i.userId.equals(userId) & i.isDismissed.equals(false),
      orderBy: (i) => i.priority,
      orderDescending: true,
      limit: 5,
    );

    // Calculate productivity score
    final total = todayTasks.length;
    int productivityScore = 100;
    if (total > 0) {
      productivityScore = ((completedToday / total) * 100).round();
    }

    // Calculate streak
    final streak = await _calculateStreak(session, userId);

    // Get greeting
    final hour = now.hour;
    String greeting = 'Good evening';
    if (hour >= 5 && hour < 12) {
      greeting = 'Good morning';
    } else if (hour >= 12 && hour < 17) {
      greeting = 'Good afternoon';
    }

    return DashboardData(
      userName: userName,
      greeting: greeting,
      todayTaskCount: todayTasks.length,
      completedTodayCount: completedToday,
      upcomingTaskCount: upcomingTasks.length,
      overdueTaskCount: overdueCount,
      productivityScore: productivityScore,
      currentStreak: streak,
      recentInsights: insights,
      upcomingTasks: upcomingTasks,
    );
  }

  Future<int> _calculateStreak(Session session, int userId) async {
    final now = DateTime.now();
    int streak = 0;

    for (var i = 0; i < 30; i++) {
      final date = now.subtract(Duration(days: i));
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));

      final completed = await Task.db.count(
        session,
        where: (t) =>
            t.userId.equals(userId) &
            t.status.equals('completed') &
            t.completedAt.notEquals(null) &
            (t.completedAt >= startOfDay) &
            (t.completedAt < endOfDay),
      );

      if (completed > 0) {
        streak++;
      } else if (i > 0) {
        break;
      }
    }
    return streak;
  }
}
