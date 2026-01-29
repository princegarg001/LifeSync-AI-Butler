import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../widgets/premium_widgets.dart';
import '../services/api_service.dart';
import '../services/auth_service.dart';

/// World-class Dashboard Screen for LifeSync AI Butler
class DashboardScreen extends StatefulWidget {
  final int userId;

  const DashboardScreen({super.key, required this.userId});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ApiService _api = ApiService.instance;

  String get userName => AuthService.instance.currentUser?.firstName ?? 'User';
  String get userInitials => AuthService.instance.currentUser?.initials ?? 'U';
  int productivityScore = 78;
  int tasksToday = 0;
  int tasksCompleted = 0;
  int streak = 7;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadDashboardData();
  }

  Future<void> _loadDashboardData() async {
    try {
      setState(() => _isLoading = true);

      // Try to load from backend - fall back to mock data if fails
      try {
        final dashboard = await _api.getDashboardData(widget.userId);
        if (mounted) {
          setState(() {
            tasksToday = dashboard.todayTaskCount;
            tasksCompleted = dashboard.completedTodayCount;
            productivityScore = dashboard.productivityScore;
            streak = dashboard.currentStreak;
            _isLoading = false;
          });
        }
      } catch (e) {
        // Backend not connected, use mock data
        if (mounted) {
          setState(() {
            tasksToday = 5;
            tasksCompleted = 3;
            productivityScore = 78;
            streak = 7;
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.backgroundGradient,
        ),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: _loadDashboardData,
            color: AppColors.primary,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // Header
                SliverToBoxAdapter(
                  child: _buildHeader(),
                ),

                // Quick Stats Grid
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverToBoxAdapter(
                    child: _buildStatsGrid(),
                  ),
                ),

                // Productivity Card
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverToBoxAdapter(
                    child: _buildProductivityCard(),
                  ),
                ),

                // AI Insights Section
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverToBoxAdapter(
                    child: _buildInsightsSection(),
                  ),
                ),

                // Today's Tasks
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverToBoxAdapter(
                    child: _buildTasksSection(),
                  ),
                ),

                // Bottom padding for nav bar
                const SliverToBoxAdapter(
                  child: SizedBox(height: 100),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final hour = DateTime.now().hour;
    String greeting = 'Good evening';
    if (hour >= 5 && hour < 12) {
      greeting = 'Good morning';
    } else if (hour >= 12 && hour < 17) {
      greeting = 'Good afternoon';
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                      '$greeting,',
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 400.ms)
                    .slideX(begin: -0.1, end: 0),
                const SizedBox(height: 4),
                Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    )
                    .animate()
                    .fadeIn(delay: 100.ms, duration: 400.ms)
                    .slideX(begin: -0.1, end: 0),
              ],
            ),
          ),

          // Profile avatar with glow
          Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppGradients.primaryGradient,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.4),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 26,
                  backgroundColor: AppColors.surface,
                  child: Text(
                    userInitials,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              )
              .animate()
              .fadeIn(delay: 200.ms, duration: 400.ms)
              .scale(begin: const Offset(0.8, 0.8)),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    return Row(
      children: [
        Expanded(
          child: StatCard(
            title: 'Today\'s Tasks',
            value: '$tasksToday',
            icon: Icons.task_alt,
            iconColor: AppColors.accent,
            delay: 100,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: StatCard(
            title: 'Completed',
            value: '$tasksCompleted',
            icon: Icons.check_circle_outline,
            iconColor: AppColors.success,
            delay: 200,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: StatCard(
            title: 'Day Streak',
            value: '$streak 🔥',
            icon: Icons.local_fire_department,
            iconColor: AppColors.warning,
            delay: 300,
          ),
        ),
      ],
    );
  }

  Widget _buildProductivityCard() {
    return GlassCard(
      animationDelay: 400,
      child: Row(
        children: [
          // Productivity ring
          ProductivityRing(percentage: productivityScore),
          const SizedBox(width: 24),

          // Productivity details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Focus Today',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  productivityScore >= 70
                      ? 'Excellent work! Keep this momentum going.'
                      : 'You\'re doing great! Let\'s tackle those remaining tasks.',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                _buildProgressRow('Deep Work', 0.75, AppColors.primary),
                const SizedBox(height: 8),
                _buildProgressRow('Meetings', 0.3, AppColors.accent),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressRow(String label, double progress, Color color) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textMuted,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: AppColors.surfaceLight,
              valueColor: AlwaysStoppedAnimation(color),
              minHeight: 6,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '${(progress * 100).toInt()}%',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textMuted,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildInsightsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'AI Insights',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: AppColors.accent,
              ),
              child: const Text('See all'),
            ),
          ],
        ).animate().fadeIn(delay: 500.ms),
        const SizedBox(height: 8),
        _buildInsightCard(
          icon: Icons.lightbulb_outline,
          title: 'Peak Performance Time',
          message:
              'You\'re most productive between 9-11 AM. Schedule important tasks during this window!',
          color: AppColors.warning,
          delay: 550,
        ),
        const SizedBox(height: 12),
        _buildInsightCard(
          icon: Icons.trending_up,
          title: 'Weekly Progress',
          message:
              'You\'ve completed 23% more tasks than last week. Keep up the great work!',
          color: AppColors.success,
          delay: 600,
        ),
      ],
    );
  }

  Widget _buildInsightCard({
    required IconData icon,
    required String title,
    required String message,
    required Color color,
    required int delay,
  }) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      animationDelay: delay,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTasksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Today\'s Tasks',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            GradientButton(
              text: 'Add Task',
              icon: Icons.add,
              onPressed: () {},
              gradient: AppGradients.accentGradient,
              height: 40,
            ),
          ],
        ).animate().fadeIn(delay: 650.ms),
        const SizedBox(height: 16),

        TaskTile(
          title: 'Review project proposal',
          priority: 'high',
          dueDate: DateTime.now(),
          isCompleted: true,
          delay: 700,
        ),
        TaskTile(
          title: 'Team standup meeting',
          priority: 'medium',
          dueDate: DateTime.now().add(const Duration(hours: 2)),
          delay: 750,
        ),
        TaskTile(
          title: 'Update client presentation',
          priority: 'urgent',
          dueDate: DateTime.now().add(const Duration(hours: 4)),
          delay: 800,
        ),
        TaskTile(
          title: 'Code review for feature branch',
          priority: 'low',
          dueDate: DateTime.now().add(const Duration(hours: 6)),
          delay: 850,
        ),
      ],
    );
  }
}
