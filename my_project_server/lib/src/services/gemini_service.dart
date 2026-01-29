import 'dart:convert';
import 'package:http/http.dart' as http;
import '../generated/protocol.dart';

/// GeminiService handles all AI interactions using Google's Gemini API.
class GeminiService {
  static String? _apiKey;
  static const String _baseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent';

  /// Set the API key (call this during server initialization)
  static void setApiKey(String key) {
    _apiKey = key;
  }

  /// Process a user message and generate an AI response
  Future<AiChatResponse> processMessage({
    required String message,
    required List<ChatMessage> conversationHistory,
    required int userId,
  }) async {
    if (_apiKey == null || _apiKey!.isEmpty) {
      return _getMockResponse(message, userId);
    }

    try {
      final response = await _callGeminiApi(message, conversationHistory);
      return _parseGeminiResponse(response, userId);
    } catch (e) {
      print('Gemini API error: $e');
      return _getMockResponse(message, userId);
    }
  }

  Future<String> _callGeminiApi(String message, List<ChatMessage> history) async {
    final contextMessages = history.take(10).map((m) => '${m.role}: ${m.content}').join('\n');

    final systemPrompt = '''
You are LifeSync Butler, a friendly AI personal assistant. Help users manage tasks and schedules.

When user wants to CREATE a task, respond with confirmation and include:
TASK_CREATE:{"title":"task title","priority":"medium","dueDate":"2026-01-28T10:00:00"}

Priority: low, medium, high, urgent. Omit dueDate if not mentioned.
Be friendly and concise. Current time: ${DateTime.now().toIso8601String()}
''';

    final fullPrompt = '$systemPrompt\n\nConversation:\n$contextMessages\n\nUser: $message\nAssistant:';

    final requestBody = {
      'contents': [
        {
          'parts': [
            {'text': fullPrompt}
          ]
        }
      ],
      'generationConfig': {
        'temperature': 0.7,
        'maxOutputTokens': 500,
      }
    };

    final response = await http.post(
      Uri.parse('$_baseUrl?key=$_apiKey'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['candidates'][0]['content']['parts'][0]['text'] ?? '';
    } else {
      throw Exception('Gemini API error: ${response.statusCode}');
    }
  }

  AiChatResponse _parseGeminiResponse(String response, int userId) {
    String message = response;
    Task? createdTask;
    String? intentType;
    List<String>? suggestedActions;

    // Check for task creation
    if (response.contains('TASK_CREATE:')) {
      intentType = 'action';
      final parts = response.split('TASK_CREATE:');
      message = parts[0].trim();
      
      try {
        final jsonStr = parts[1].trim().split('\n')[0];
        final taskData = jsonDecode(jsonStr);
        createdTask = Task(
          userId: userId,
          title: taskData['title'] ?? 'New Task',
          description: taskData['description'],
          priority: taskData['priority'] ?? 'medium',
          status: 'pending',
          dueDate: taskData['dueDate'] != null 
              ? DateTime.parse(taskData['dueDate']) 
              : null,
          createdAt: DateTime.now(),
        );
      } catch (e) {
        print('Error parsing task JSON: $e');
      }
    } else if (response.toLowerCase().contains('schedule') || 
               response.toLowerCase().contains('task')) {
      intentType = 'query';
      suggestedActions = ['View all tasks', 'Create new task', 'Show today'];
    } else {
      intentType = 'greeting';
      suggestedActions = ['What are my tasks?', 'Create a task', 'Show insights'];
    }

    return AiChatResponse(
      message: message.isEmpty ? response : message,
      intentType: intentType,
      suggestedActions: suggestedActions,
      createdTask: createdTask,
    );
  }

  AiChatResponse _getMockResponse(String message, int userId) {
    final lowerMessage = message.toLowerCase();

    // Task creation intent
    if (lowerMessage.contains('create') || lowerMessage.contains('add') || 
        lowerMessage.contains('remind') || lowerMessage.contains('schedule')) {
      
      String title = 'New Task';
      String priority = 'medium';
      DateTime? dueDate;

      // Extract task title (simplified)
      if (lowerMessage.contains('to ')) {
        final parts = message.split(RegExp(r'\bto\b', caseSensitive: false));
        if (parts.length > 1) {
          title = parts[1].trim().split(RegExp(r'\b(tomorrow|today|next)\b'))[0].trim();
          if (title.length > 50) title = title.substring(0, 50);
        }
      }

      // Check for time mentions
      if (lowerMessage.contains('tomorrow')) {
        dueDate = DateTime.now().add(const Duration(days: 1));
      } else if (lowerMessage.contains('today')) {
        dueDate = DateTime.now();
      } else if (lowerMessage.contains('next week')) {
        dueDate = DateTime.now().add(const Duration(days: 7));
      }

      // Check priority
      if (lowerMessage.contains('urgent') || lowerMessage.contains('important')) {
        priority = 'high';
      }

      return AiChatResponse(
        message: "I've created a task for you: \"$title\". ${dueDate != null ? 'Due ${_formatDate(dueDate)}.' : ''} Is there anything else you'd like me to help with?",
        intentType: 'action',
        suggestedActions: ['View all tasks', 'Create another', 'Set reminder'],
        createdTask: Task(
          userId: userId,
          title: title.isEmpty ? 'New Task' : title,
          priority: priority,
          status: 'pending',
          dueDate: dueDate,
          aiSuggested: true,
          createdAt: DateTime.now(),
        ),
      );
    }

    // Schedule query
    if (lowerMessage.contains('schedule') || lowerMessage.contains('today') ||
        lowerMessage.contains('tasks') || lowerMessage.contains('what')) {
      return AiChatResponse(
        message: "I can help you check your schedule! Would you like to see today's tasks, upcoming tasks, or your productivity stats?",
        intentType: 'query',
        suggestedActions: ["Today's tasks", 'Upcoming tasks', 'Show stats'],
      );
    }

    // Greeting
    if (lowerMessage.contains('hello') || lowerMessage.contains('hi') ||
        lowerMessage.contains('hey') || message.length < 10) {
      final hour = DateTime.now().hour;
      final greeting = hour < 12 ? 'Good morning' : (hour < 17 ? 'Good afternoon' : 'Good evening');
      return AiChatResponse(
        message: "$greeting! I'm your LifeSync Butler. How can I help you today? I can help you manage tasks, check your schedule, or provide productivity insights.",
        intentType: 'greeting',
        suggestedActions: ['Create a task', "What's my schedule?", 'Show insights'],
      );
    }

    // Default helpful response
    return AiChatResponse(
      message: "I'm here to help! I can create tasks, show your schedule, or provide productivity tips. What would you like to do?",
      intentType: 'query',
      suggestedActions: ['Create task', 'View schedule', 'Get insights'],
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateOnly = DateTime(date.year, date.month, date.day);
    
    if (dateOnly == today) return 'today';
    if (dateOnly == today.add(const Duration(days: 1))) return 'tomorrow';
    
    return '${date.day}/${date.month}/${date.year}';
  }
}
