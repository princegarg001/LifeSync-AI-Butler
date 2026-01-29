import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../services/gemini_service.dart';

/// ChatEndpoint handles AI conversation functionality using Google Gemini.
class ChatEndpoint extends Endpoint {
  /// Send a message to the AI butler and get a response
  Future<AiChatResponse> sendMessage(
    Session session,
    int userId,
    String message,
  ) async {
    // Store user message
    final userMessage = ChatMessage(
      userId: userId,
      role: 'user',
      content: message,
      timestamp: DateTime.now(),
    );
    await ChatMessage.db.insertRow(session, userMessage);

    // Get conversation history
    final history = await ChatMessage.db.find(
      session,
      where: (m) => m.userId.equals(userId),
      orderBy: (m) => m.timestamp,
      orderDescending: true,
      limit: 10,
    );

    // Process with Gemini AI
    final geminiService = GeminiService();
    final aiResponse = await geminiService.processMessage(
      message: message,
      conversationHistory: history,
      userId: userId,
    );

    // Store assistant response
    final assistantMessage = ChatMessage(
      userId: userId,
      role: 'assistant',
      content: aiResponse.message,
      intentType: aiResponse.intentType,
      timestamp: DateTime.now(),
    );
    await ChatMessage.db.insertRow(session, assistantMessage);

    // If AI suggests creating a task, create it
    if (aiResponse.createdTask != null) {
      aiResponse.createdTask!.createdAt = DateTime.now();
      aiResponse.createdTask!.aiSuggested = true;
      final createdTask = await Task.db.insertRow(
        session,
        aiResponse.createdTask!,
      );
      return AiChatResponse(
        message: aiResponse.message,
        intentType: aiResponse.intentType,
        suggestedActions: aiResponse.suggestedActions,
        createdTask: createdTask,
      );
    }

    return aiResponse;
  }

  /// Get chat history for a user
  Future<List<ChatMessage>> getChatHistory(Session session, int userId) async {
    return await ChatMessage.db.find(
      session,
      where: (m) => m.userId.equals(userId),
      orderBy: (m) => m.timestamp,
      orderDescending: true,
      limit: 50,
    );
  }

  /// Clear chat history for a user
  Future<bool> clearChatHistory(Session session, int userId) async {
    final deleted = await ChatMessage.db.deleteWhere(
      session,
      where: (m) => m.userId.equals(userId),
    );
    return deleted.isNotEmpty;
  }

  /// Get quick suggestions based on time
  Future<List<String>> getQuickSuggestions(Session session) async {
    final hour = DateTime.now().hour;
    
    if (hour >= 6 && hour < 12) {
      return [
        "What's on my schedule today?",
        "Show my morning tasks",
        "Create a reminder for later",
      ];
    } else if (hour >= 12 && hour < 17) {
      return [
        "How am I doing on today's tasks?",
        "Schedule a task for tomorrow",
        "Show my productivity stats",
      ];
    } else if (hour >= 17 && hour < 22) {
      return [
        "What's left for today?",
        "Plan my tomorrow",
        "Review my completed tasks",
      ];
    } else {
      return [
        "Set a morning reminder",
        "What do I have tomorrow?",
        "Show weekly summary",
      ];
    }
  }
}
