import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// TaskEndpoint handles all task-related operations for LifeSync AI Butler.
class TaskEndpoint extends Endpoint {
  /// Create a new task
  Future<Task> createTask(Session session, Task task) async {
    task.createdAt = DateTime.now();
    return await Task.db.insertRow(session, task);
  }

  /// Get all tasks for a user
  Future<List<Task>> getTasks(Session session, int userId) async {
    return await Task.db.find(
      session,
      where: (t) => t.userId.equals(userId),
      orderBy: (t) => t.dueDate,
    );
  }

  /// Get tasks with status filter
  Future<List<Task>> getTasksByStatus(Session session, int userId, String status) async {
    return await Task.db.find(
      session,
      where: (t) => t.userId.equals(userId) & t.status.equals(status),
      orderBy: (t) => t.dueDate,
    );
  }

  /// Get today's tasks for a user
  Future<List<Task>> getTodaysTasks(Session session, int userId) async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return await Task.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          t.dueDate.notEquals(null) &
          (t.dueDate >= startOfDay) &
          (t.dueDate < endOfDay),
      orderBy: (t) => t.dueDate,
    );
  }

  /// Get overdue tasks for a user
  Future<List<Task>> getOverdueTasks(Session session, int userId) async {
    final now = DateTime.now();
    return await Task.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          t.status.notEquals('completed') &
          t.status.notEquals('cancelled') &
          t.dueDate.notEquals(null) &
          (t.dueDate < now),
      orderBy: (t) => t.dueDate,
    );
  }

  /// Get upcoming tasks (next 7 days)
  Future<List<Task>> getUpcomingTasks(Session session, int userId) async {
    final now = DateTime.now();
    final weekFromNow = now.add(const Duration(days: 7));

    return await Task.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          t.status.notEquals('completed') &
          t.status.notEquals('cancelled') &
          t.dueDate.notEquals(null) &
          (t.dueDate >= now) &
          (t.dueDate <= weekFromNow),
      orderBy: (t) => t.dueDate,
      limit: 20,
    );
  }

  /// Update an existing task
  Future<Task> updateTask(Session session, Task task) async {
    return await Task.db.updateRow(session, task);
  }

  /// Mark a task as completed
  Future<Task?> completeTask(Session session, int taskId) async {
    final task = await Task.db.findById(session, taskId);
    if (task == null) return null;

    task.status = 'completed';
    task.completedAt = DateTime.now();
    return await Task.db.updateRow(session, task);
  }

  /// Delete a task
  Future<bool> deleteTask(Session session, int taskId) async {
    final rowsDeleted = await Task.db.deleteWhere(
      session,
      where: (t) => t.id.equals(taskId),
    );
    return rowsDeleted.isNotEmpty;
  }

  /// Get task count by status
  Future<int> getTaskCount(Session session, int userId, String status) async {
    return await Task.db.count(
      session,
      where: (t) => t.userId.equals(userId) & t.status.equals(status),
    );
  }
}
