import 'package:my_project_client/my_project_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

/// Singleton API service for connecting Flutter to Serverpod backend
class ApiService {
  static ApiService? _instance;
  late Client _client;

  ApiService._internal() {
    _client = Client(
      'http://localhost:8080/',
    )..connectivityMonitor = FlutterConnectivityMonitor();
  }

  static ApiService get instance {
    _instance ??= ApiService._internal();
    return _instance!;
  }

  Client get client => _client;

  // ========== Task Methods ==========

  /// Create a new task
  Future<Task> createTask({
    required int userId,
    required String title,
    String? description,
    String priority = 'medium',
    String? category,
    DateTime? dueDate,
    bool isRecurring = false,
  }) async {
    final task = Task(
      userId: userId,
      title: title,
      description: description,
      priority: priority,
      status: 'pending',
      category: category,
      dueDate: dueDate,
      isRecurring: isRecurring,
      createdAt: DateTime.now(),
      aiSuggested: false,
    );
    return await _client.task.createTask(task);
  }

  /// Get all tasks for a user
  Future<List<Task>> getUserTasks(int userId) async {
    return await _client.task.getTasks(userId);
  }

  /// Get today's tasks
  Future<List<Task>> getTodayTasks(int userId) async {
    return await _client.task.getTodaysTasks(userId);
  }

  /// Complete a task
  Future<Task?> completeTask(int taskId) async {
    return await _client.task.completeTask(taskId);
  }

  /// Delete a task
  Future<bool> deleteTask(int taskId) async {
    return await _client.task.deleteTask(taskId);
  }

  // ========== Chat Methods ==========

  /// Send a message to AI butler
  Future<AiChatResponse> sendMessage(int userId, String message) async {
    return await _client.chat.sendMessage(userId, message);
  }

  /// Get chat history
  Future<List<ChatMessage>> getChatHistory(int userId, {int limit = 50}) async {
    return await _client.chat.getChatHistory(userId);
  }

  /// Clear chat history
  Future<bool> clearChatHistory(int userId) async {
    return await _client.chat.clearChatHistory(userId);
  }

  /// Get quick suggestions
  Future<List<String>> getQuickSuggestions() async {
    return await _client.chat.getQuickSuggestions();
  }

  // ========== Dashboard Methods ==========

  /// Get dashboard data
  Future<DashboardData> getDashboardData(
    int userId, {
    String userName = 'User',
  }) async {
    return await _client.dashboard.getDashboardData(userId, userName);
  }

  // ========== Insight Methods ==========

  /// Get insights for a user
  Future<List<Insight>> getInsights(int userId) async {
    return await _client.insight.getInsights(userId);
  }

  /// Generate new insights
  Future<List<Insight>> generateInsights(int userId) async {
    return await _client.insight.generateInsights(userId);
  }

  // ========== User Methods ==========

  /// Get user profile by email
  Future<User?> getUserByEmail(String email) async {
    return await _client.user.getUserByEmail(email);
  }

  /// Get user by ID
  Future<User?> getUserById(int userId) async {
    return await _client.user.getUserById(userId);
  }

  /// Create or update user profile
  Future<User> createOrUpdateUser(User user) async {
    return await _client.user.createOrUpdateUser(user);
  }

  /// Update user preferences
  Future<User> updatePreferences(
    int userId, {
    String? timezone,
    bool? notificationsEnabled,
  }) async {
    return await _client.user.updatePreferences(
      userId,
      timezone: timezone,
      notificationsEnabled: notificationsEnabled,
    );
  }
}
