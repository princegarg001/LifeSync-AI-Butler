import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../services/api_service.dart';

/// AI Chat Screen with premium messaging UI
class ChatScreen extends StatefulWidget {
  final int userId;
  
  const ChatScreen({super.key, required this.userId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ApiService _api = ApiService.instance;
  final List<ChatMessageUI> _messages = [];
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    // Add welcome message
    _messages.add(ChatMessageUI(
      text: "Hello! I'm your LifeSync Butler 🤖\n\nI can help you manage tasks, check your schedule, and provide productivity insights. What can I do for you today?",
      isUser: false,
      timestamp: DateTime.now(),
    ));
    _loadChatHistory();
  }
  
  Future<void> _loadChatHistory() async {
    try {
      final history = await _api.getChatHistory(widget.userId, limit: 20);
      if (mounted && history.isNotEmpty) {
        setState(() {
          _messages.clear();
          for (final msg in history) {
            _messages.add(ChatMessageUI(
              text: msg.content,
              isUser: msg.role == 'user',
              timestamp: msg.timestamp,
            ));
          }
        });
      }
    } catch (e) {
      // Backend not connected, keep default welcome message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.backgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Messages list
              Expanded(
                child: _buildMessagesList(),
              ),
              
              // Quick suggestions
              if (_messages.length < 3) _buildQuickSuggestions(),
              
              // Input area
              _buildInputArea(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: AppGradients.primaryGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.auto_awesome, size: 20, color: Colors.white),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AI Butler',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Online • Ready to help',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.success,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: _clearHistory,
          tooltip: 'Clear history',
        ),
      ],
    );
  }
  
  Future<void> _clearHistory() async {
    try {
      await _api.clearChatHistory(widget.userId);
    } catch (e) {
      // Ignore backend errors
    }
    setState(() {
      _messages.clear();
      _messages.add(ChatMessageUI(
        text: "Chat history cleared! How can I help you today?",
        isUser: false,
        timestamp: DateTime.now(),
      ));
    });
  }

  Widget _buildMessagesList() {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: _messages.length + (_isTyping ? 1 : 0),
      itemBuilder: (context, index) {
        if (_isTyping && index == _messages.length) {
          return _buildTypingIndicator();
        }
        return _buildMessageBubble(_messages[index], index);
      },
    );
  }

  Widget _buildMessageBubble(ChatMessageUI message, int index) {
    final isUser = message.isUser;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) ...[
            // AI Avatar
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: AppGradients.primaryGradient,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.auto_awesome,
                size: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 12),
          ],
          
          // Message bubble
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              decoration: BoxDecoration(
                gradient: isUser ? AppGradients.primaryGradient : null,
                color: isUser ? null : AppColors.surface,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: Radius.circular(isUser ? 20 : 6),
                  bottomRight: Radius.circular(isUser ? 6 : 20),
                ),
                border: isUser ? null : Border.all(color: AppColors.glassBorder),
                boxShadow: [
                  BoxShadow(
                    color: isUser
                        ? AppColors.primary.withValues(alpha: 0.3)
                        : Colors.black.withValues(alpha: 0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  fontSize: 15,
                  color: isUser ? Colors.white : AppColors.textPrimary,
                  height: 1.4,
                ),
              ),
            ),
          ),
          
          if (isUser) const SizedBox(width: 8),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 300.ms)
        .slideX(
          begin: isUser ? 0.1 : -0.1,
          end: 0,
          curve: Curves.easeOutCubic,
        );
  }

  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: AppGradients.primaryGradient,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.auto_awesome,
              size: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.glassBorder),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                3,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                )
                    .animate(
                      onComplete: (c) => c.repeat(),
                    )
                    .scale(
                      delay: Duration(milliseconds: index * 150),
                      duration: 600.ms,
                      begin: const Offset(0.8, 0.8),
                      end: const Offset(1.2, 1.2),
                    )
                    .then()
                    .scale(
                      duration: 600.ms,
                      begin: const Offset(1.2, 1.2),
                      end: const Offset(0.8, 0.8),
                    ),
              ),
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 300.ms);
  }

  Widget _buildQuickSuggestions() {
    final suggestions = [
      '📋 Create a task',
      '📅 Show my schedule',
      '💡 Give me insights',
    ];
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: suggestions.asMap().entries.map((entry) {
            final index = entry.key;
            final suggestion = entry.value;
            
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Material(
                color: AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () => _sendMessage(suggestion.split(' ').skip(1).join(' ')),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.glassBorder),
                    ),
                    child: Text(
                      suggestion,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            )
                .animate()
                .fadeIn(delay: Duration(milliseconds: 100 + index * 100))
                .slideY(begin: 0.2, end: 0);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.9),
        border: const Border(top: BorderSide(color: AppColors.glassBorder)),
      ),
      child: Row(
        children: [
          // Voice input button
          Container(
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(14),
            ),
            child: IconButton(
              icon: const Icon(Icons.mic, color: AppColors.textSecondary),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 12),
          
          // Text input
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: TextField(
                controller: _messageController,
                style: const TextStyle(color: AppColors.textPrimary),
                decoration: const InputDecoration(
                  hintText: 'Ask me anything...',
                  hintStyle: TextStyle(color: AppColors.textMuted),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                ),
                onSubmitted: _sendMessage,
              ),
            ),
          ),
          const SizedBox(width: 12),
          
          // Send button
          Container(
            decoration: BoxDecoration(
              gradient: AppGradients.primaryGradient,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.send_rounded, color: Colors.white),
              onPressed: () => _sendMessage(_messageController.text),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    
    setState(() {
      _messages.add(ChatMessageUI(
        text: text,
        isUser: true,
        timestamp: DateTime.now(),
      ));
      _messageController.clear();
      _isTyping = true;
    });
    
    // Scroll to bottom
    _scrollToBottom();
    
    // Try to get real AI response, fall back to mock
    try {
      final response = await _api.sendMessage(widget.userId, text);
      if (mounted) {
        setState(() {
          _isTyping = false;
          _messages.add(ChatMessageUI(
            text: response.message,
            isUser: false,
            timestamp: DateTime.now(),
          ));
        });
        _scrollToBottom();
      }
    } catch (e) {
      // Backend not connected, use mock response
      await Future.delayed(const Duration(milliseconds: 1500));
      if (mounted) {
        setState(() {
          _isTyping = false;
          _messages.add(ChatMessageUI(
            text: _getMockResponse(text),
            isUser: false,
            timestamp: DateTime.now(),
          ));
        });
        _scrollToBottom();
      }
    }
  }
  
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String _getMockResponse(String input) {
    final lower = input.toLowerCase();
    
    if (lower.contains('create') || lower.contains('task') || lower.contains('remind')) {
      return "✅ I've created a new task for you!\n\nTask: \"${input.replaceFirst(RegExp(r'create|add|remind me to', caseSensitive: false), '').trim()}\"\nPriority: Medium\nDue: Today\n\nWould you like to set a specific time or priority?";
    }
    
    if (lower.contains('schedule') || lower.contains('today')) {
      return "📅 Here's your schedule for today:\n\n• 9:00 AM - Team standup\n• 11:00 AM - Client call\n• 2:00 PM - Project review\n• 4:00 PM - Code review\n\nYou have 4 tasks remaining. Need help prioritizing?";
    }
    
    if (lower.contains('insight') || lower.contains('productivity')) {
      return "📊 Here are your insights:\n\n🔥 You've completed 23% more tasks this week!\n⏰ Your most productive hours are 9-11 AM\n📈 Task completion rate: 87%\n\nKeep up the amazing work! Would you like tips to improve further?";
    }
    
    return "I understand you want help with \"$input\". I can:\n\n• Create and manage tasks\n• Show your schedule\n• Provide productivity insights\n\nWhat would you like me to do?";
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}

class ChatMessageUI {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  ChatMessageUI({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}
