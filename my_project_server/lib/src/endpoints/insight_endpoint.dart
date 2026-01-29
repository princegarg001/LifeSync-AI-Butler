import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// InsightEndpoint manages AI-generated insights and productivity tips.
class InsightEndpoint extends Endpoint {
  /// Get all active insights for a user
  Future<List<Insight>> getInsights(Session session, int userId) async {
    return await Insight.db.find(
      session,
      where: (i) => i.userId.equals(userId) & i.isDismissed.equals(false),
      orderBy: (i) => i.priority,
      orderDescending: true,
    );
  }

  /// Create a new insight
  Future<Insight> createInsight(Session session, Insight insight) async {
    insight.generatedAt = DateTime.now();
    return await Insight.db.insertRow(session, insight);
  }

  /// Dismiss an insight
  Future<bool> dismissInsight(Session session, int insightId) async {
    final insight = await Insight.db.findById(session, insightId);
    if (insight == null) return false;

    insight.isDismissed = true;
    await Insight.db.updateRow(session, insight);
    return true;
  }

  /// Generate smart insights based on user's task data
  Future<List<Insight>> generateInsights(Session session, int userId) async {
    final now = DateTime.now();
    final insights = <Insight>[];

    // Check for overdue tasks
    final overdueTasks = await Task.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          t.status.notEquals('completed') &
          t.status.notEquals('cancelled') &
          t.dueDate.notEquals(null) &
          (t.dueDate < now),
    );

    if (overdueTasks.isNotEmpty) {
      insights.add(
        Insight(
          userId: userId,
          type: 'warning',
          title: 'Overdue Tasks',
          message:
              'You have ${overdueTasks.length} overdue task${overdueTasks.length > 1 ? 's' : ''}. Consider rescheduling or completing them.',
          priority: 2,
          iconName: 'warning_amber',
          actionType: 'navigate',
          actionData: 'tasks?filter=overdue',
          isDismissed: false,
          generatedAt: now,
        ),
      );
    }

    // Check for high priority tasks due today
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final urgentToday = await Task.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          t.status.notEquals('completed') &
          (t.priority.equals('high') | t.priority.equals('urgent')) &
          t.dueDate.notEquals(null) &
          (t.dueDate >= startOfDay) &
          (t.dueDate < endOfDay),
    );

    if (urgentToday.isNotEmpty) {
      insights.add(
        Insight(
          userId: userId,
          type: 'reminder',
          title: 'Urgent Tasks Today',
          message:
              '${urgentToday.length} high-priority task${urgentToday.length > 1 ? 's' : ''} due today. Focus on these first!',
          priority: 2,
          iconName: 'priority_high',
          actionType: 'navigate',
          actionData: 'tasks?filter=today&priority=high',
          isDismissed: false,
          generatedAt: now,
        ),
      );
    }

    // Productivity tip based on time
    final hour = now.hour;
    if (hour >= 9 && hour <= 11) {
      insights.add(
        Insight(
          userId: userId,
          type: 'productivity',
          title: 'Peak Performance Time',
          message:
              'Morning hours are great for focused work. Tackle your most challenging task now!',
          priority: 1,
          iconName: 'trending_up',
          isDismissed: false,
          generatedAt: now,
        ),
      );
    } else if (hour >= 14 && hour <= 15) {
      insights.add(
        Insight(
          userId: userId,
          type: 'productivity',
          title: 'Post-Lunch Dip',
          message:
              'Energy typically dips after lunch. Consider a quick walk or tackling easier tasks.',
          priority: 0,
          iconName: 'coffee',
          isDismissed: false,
          generatedAt: now,
        ),
      );
    }

    // Store generated insights
    for (final insight in insights) {
      await Insight.db.insertRow(session, insight);
    }

    return insights;
  }

  /// Get insight count for badge display
  Future<int> getActiveInsightCount(Session session, int userId) async {
    return await Insight.db.count(
      session,
      where: (i) => i.userId.equals(userId) & i.isDismissed.equals(false),
    );
  }
}
