import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:math' as math;
import '../theme/app_theme.dart';
import '../widgets/premium_widgets.dart';
import '../services/api_service.dart';

/// AI Voice Butler - Hackathon-winning voice assistant feature
class VoiceButlerScreen extends StatefulWidget {
  final int userId;
  
  const VoiceButlerScreen({super.key, required this.userId});

  @override
  State<VoiceButlerScreen> createState() => _VoiceButlerScreenState();
}

class _VoiceButlerScreenState extends State<VoiceButlerScreen>
    with TickerProviderStateMixin {
  final ApiService _api = ApiService.instance;
  
  bool _isListening = false;
  bool _isProcessing = false;
  bool _isSpeaking = false;
  String _transcribedText = '';
  String _aiResponse = '';
  String _currentAction = '';
  
  late AnimationController _pulseController;
  late AnimationController _waveController;
  
  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat();
  }
  
  @override
  void dispose() {
    _pulseController.dispose();
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.backgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              _buildHeader(),
              
              // Main voice interface
              Expanded(
                child: _buildVoiceInterface(),
              ),
              
              // Quick command suggestions
              _buildQuickCommands(),
              
              // Bottom controls
              _buildBottomControls(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
            onPressed: () => Navigator.pop(context),
          ),
          const Expanded(
            child: Text(
              'Voice Butler',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.circle, size: 8, color: AppColors.success),
                SizedBox(width: 6),
                Text(
                  'AI Ready',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.success,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVoiceInterface() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Voice visualizer orb
          _buildVoiceOrb(),
          
          const SizedBox(height: 40),
          
          // Status text
          _buildStatusText(),
          
          const SizedBox(height: 24),
          
          // Transcribed text or AI response
          if (_transcribedText.isNotEmpty || _aiResponse.isNotEmpty)
            _buildResponseCard(),
        ],
      ),
    );
  }

  Widget _buildVoiceOrb() {
    return GestureDetector(
      onTapDown: (_) => _startListening(),
      onTapUp: (_) => _stopListening(),
      onTapCancel: () => _stopListening(),
      child: AnimatedBuilder(
        animation: _pulseController,
        builder: (context, child) {
          return Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: _isListening
                  ? AppGradients.accentGradient
                  : AppGradients.primaryGradient,
              boxShadow: [
                BoxShadow(
                  color: (_isListening ? AppColors.accent : AppColors.primary)
                      .withValues(alpha: 0.3 + (_pulseController.value * 0.3)),
                  blurRadius: 30 + (_pulseController.value * 20),
                  spreadRadius: _isListening ? 10 + (_pulseController.value * 10) : 5,
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Animated rings
                if (_isListening) ..._buildAnimatedRings(),
                
                // Center icon
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: _isListening
                      ? _buildWaveform()
                      : _isProcessing
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3,
                            )
                          : Icon(
                              _isSpeaking ? Icons.volume_up : Icons.mic,
                              size: 64,
                              color: Colors.white,
                              key: ValueKey(_isSpeaking),
                            ),
                ),
              ],
            ),
          )
              .animate(target: _isListening ? 1 : 0)
              .scale(
                begin: const Offset(1, 1),
                end: const Offset(1.1, 1.1),
                duration: 200.ms,
              );
        },
      ),
    );
  }

  List<Widget> _buildAnimatedRings() {
    return List.generate(3, (index) {
      return AnimatedBuilder(
        animation: _waveController,
        builder: (context, child) {
          final progress = (_waveController.value + (index * 0.33)) % 1.0;
          return Container(
            width: 200 + (progress * 100),
            height: 200 + (progress * 100),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.accent.withValues(alpha: 0.5 - (progress * 0.5)),
                width: 2,
              ),
            ),
          );
        },
      );
    });
  }

  Widget _buildWaveform() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(7, (index) {
        return AnimatedBuilder(
          animation: _waveController,
          builder: (context, child) {
            final offset = math.sin((_waveController.value * 2 * math.pi) + (index * 0.5));
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: 6,
              height: 20 + (offset.abs() * 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
              ),
            );
          },
        );
      }),
    );
  }

  Widget _buildStatusText() {
    String statusText;
    Color statusColor;
    
    if (_isListening) {
      statusText = 'Listening...';
      statusColor = AppColors.accent;
    } else if (_isProcessing) {
      statusText = 'Processing with AI...';
      statusColor = AppColors.primary;
    } else if (_isSpeaking) {
      statusText = 'Speaking...';
      statusColor = AppColors.success;
    } else if (_currentAction.isNotEmpty) {
      statusText = _currentAction;
      statusColor = AppColors.success;
    } else {
      statusText = 'Hold to speak';
      statusColor = AppColors.textSecondary;
    }
    
    return Column(
      children: [
        Text(
          statusText,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: statusColor,
          ),
        )
            .animate(target: _isListening ? 1 : 0)
            .shimmer(duration: 1.seconds, color: AppColors.accent.withValues(alpha: 0.3)),
        if (!_isListening && !_isProcessing && !_isSpeaking)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'or tap a quick command below',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textMuted,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildResponseCard() {
    return Animate(
      effects: [
        FadeEffect(duration: 300.ms),
        SlideEffect(begin: const Offset(0, 0.1), end: Offset.zero),
      ],
      child: GlassCard(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_transcribedText.isNotEmpty) ...[
              Row(
                children: [
                  Icon(Icons.mic, size: 16, color: AppColors.accent),
                  const SizedBox(width: 8),
                  const Text(
                    'You said:',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                _transcribedText,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
            if (_aiResponse.isNotEmpty) ...[
              if (_transcribedText.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Divider(color: AppColors.glassBorder),
                ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      gradient: AppGradients.primaryGradient,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(Icons.auto_awesome, size: 12, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'AI Butler:',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                _aiResponse,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimary,
                  height: 1.5,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildQuickCommands() {
    final commands = [
      {'icon': Icons.wb_sunny, 'text': 'Daily briefing', 'color': AppColors.warning},
      {'icon': Icons.add_task, 'text': 'Create task', 'color': AppColors.accent},
      {'icon': Icons.calendar_today, 'text': 'My schedule', 'color': AppColors.primary},
      {'icon': Icons.insights, 'text': 'Insights', 'color': AppColors.success},
    ];
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: commands.asMap().entries.map((entry) {
            final index = entry.key;
            final cmd = entry.value;
            
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () => _executeQuickCommand(cmd['text'] as String),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.glassBorder),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: (cmd['color'] as Color).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          cmd['icon'] as IconData,
                          size: 18,
                          color: cmd['color'] as Color,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        cmd['text'] as String,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
                .animate()
                .fadeIn(delay: Duration(milliseconds: 100 + (index * 100)))
                .slideX(begin: 0.2, end: 0);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildBottomControls() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildControlButton(
            icon: Icons.history,
            label: 'History',
            onTap: () {},
          ),
          _buildControlButton(
            icon: Icons.settings_voice,
            label: 'Settings',
            onTap: () {},
          ),
          _buildControlButton(
            icon: Icons.help_outline,
            label: 'Help',
            onTap: _showHelpDialog,
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.glassBorder),
            ),
            child: Icon(icon, color: AppColors.textSecondary, size: 22),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }

  void _startListening() {
    setState(() {
      _isListening = true;
      _transcribedText = '';
      _aiResponse = '';
      _currentAction = '';
    });
    
    // Simulate voice recognition (in real app, use speech_to_text package)
    // For demo, we'll use predefined phrases
  }

  void _stopListening() async {
    if (!_isListening) return;
    
    setState(() {
      _isListening = false;
      _isProcessing = true;
    });
    
    // Simulate transcription
    await Future.delayed(const Duration(milliseconds: 500));
    
    // For demo, simulate a recognized phrase
    final demoPhrase = 'Give me my daily briefing';
    
    setState(() {
      _transcribedText = demoPhrase;
    });
    
    await _processCommand(demoPhrase);
  }

  void _executeQuickCommand(String command) async {
    setState(() {
      _transcribedText = command;
      _isProcessing = true;
      _aiResponse = '';
    });
    
    await _processCommand(command);
  }

  Future<void> _processCommand(String command) async {
    try {
      // Try to get real AI response
      final response = await _api.sendMessage(widget.userId, command);
      
      setState(() {
        _isProcessing = false;
        _aiResponse = response.message;
        _currentAction = _getActionFromIntent(response.intentType ?? '');
        _isSpeaking = true;
      });
      
      // Simulate speaking duration
      await Future.delayed(const Duration(seconds: 3));
      
      setState(() {
        _isSpeaking = false;
      });
    } catch (e) {
      // Fallback to mock response
      await Future.delayed(const Duration(seconds: 1));
      
      setState(() {
        _isProcessing = false;
        _aiResponse = _getMockResponse(command);
        _isSpeaking = true;
      });
      
      await Future.delayed(const Duration(seconds: 2));
      
      setState(() {
        _isSpeaking = false;
      });
    }
  }

  String _getActionFromIntent(String intent) {
    switch (intent.toLowerCase()) {
      case 'create_task':
        return '✅ Task created successfully!';
      case 'query_schedule':
        return '📅 Showing your schedule';
      case 'get_insights':
        return '📊 Here are your insights';
      default:
        return '';
    }
  }

  String _getMockResponse(String command) {
    final lower = command.toLowerCase();
    
    if (lower.contains('briefing') || lower.contains('daily')) {
      return '''🌅 Good afternoon! Here's your daily briefing:

📋 **Tasks Today:** You have 5 tasks scheduled
   • 3 completed ✅
   • 2 remaining

📈 **Productivity:** 78% - Above your weekly average!

🔥 **Streak:** 7 days - Keep it up!

💡 **Tip:** Your focus peaks between 9-11 AM. Schedule important work then.

Ready to conquer the day! 💪''';
    }
    
    if (lower.contains('create task') || lower.contains('remind')) {
      return '''✅ I'll create that task for you!

Please tell me:
• What's the task?
• When is it due?
• Priority level?

Or just describe it naturally, like:
"Remind me to prepare presentation for Monday at 2pm, high priority"''';
    }
    
    if (lower.contains('schedule') || lower.contains('calendar')) {
      return '''📅 Here's your schedule for today:

• 10:00 AM - Team standup ✅
• 11:30 AM - Client call 
• 2:00 PM - Project review 
• 4:30 PM - Code review 

You have 2 hours of free time. Would you like me to suggest how to use it?''';
    }
    
    if (lower.contains('insight')) {
      return '''📊 Your Productivity Insights:

🎯 **This Week:**
   • Tasks completed: 23 (+15% vs last week)
   • Focus time: 18 hours
   • Most productive day: Wednesday

💡 **Recommendations:**
   1. Take a 5-min break every 90 minutes
   2. Batch similar tasks together
   3. Use your morning peak hours wisely

Keep crushing it! 🚀''';
    }
    
    return '''I understand you said: "$command"

I can help you with:
• 🌅 Daily briefing - "Give me my daily briefing"
• ✅ Create tasks - "Remind me to..."
• 📅 Check schedule - "What's on my calendar?"
• 📊 Get insights - "Show my productivity insights"

Try one of these commands!''';
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: AppGradients.primaryGradient,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.help_outline, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'How to use Voice Butler',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildHelpItem(Icons.touch_app, 'Hold the orb to speak'),
              _buildHelpItem(Icons.mic, 'Release to process your command'),
              _buildHelpItem(Icons.auto_awesome, 'AI understands natural language'),
              _buildHelpItem(Icons.bolt, 'Use quick commands for common actions'),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: GradientButton(
                  text: 'Got it!',
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHelpItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.accent),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
