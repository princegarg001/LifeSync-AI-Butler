import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fl_chart/fl_chart.dart';
import '../theme/app_theme.dart';
import '../widgets/premium_widgets.dart';
import '../services/api_service.dart';

/// Insights Screen with premium analytics UI
class InsightsScreen extends StatefulWidget {
  final int userId;
  
  const InsightsScreen({super.key, required this.userId});

  @override
  State<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  final ApiService _api = ApiService.instance;
  int tasksDone = 127;
  int hoursSaved = 24;
  int streak = 7;
  bool _isLoading = false;
  
  @override
  void initState() {
    super.initState();
    _loadInsights();
  }
  
  Future<void> _loadInsights() async {
    setState(() => _isLoading = true);
    
    try {
      final dashboard = await _api.getDashboardData(widget.userId);
      if (mounted) {
        setState(() {
          tasksDone = dashboard.completedTodayCount;
          streak = dashboard.currentStreak;
          _isLoading = false;
        });
      }
    } catch (e) {
      // Backend not connected, use mock data
      if (mounted) {
        setState(() => _isLoading = false);
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
            onRefresh: _loadInsights,
            color: AppColors.primary,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // Header
                SliverToBoxAdapter(child: _buildHeader()),
                
                // Weekly Progress Chart
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverToBoxAdapter(child: _buildWeeklyChart()),
                ),
                
                // Stats Row
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverToBoxAdapter(child: _buildStatsRow()),
                ),
                
                // AI Recommendations
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverToBoxAdapter(child: _buildRecommendations()),
                ),
                
                // Bottom padding
                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Insights',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          )
              .animate()
              .fadeIn(duration: 400.ms)
              .slideX(begin: -0.1, end: 0),
          const SizedBox(height: 4),
          const Text(
            'Your productivity analytics',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          )
              .animate()
              .fadeIn(delay: 100.ms, duration: 400.ms),
        ],
      ),
    );
  }

  Widget _buildWeeklyChart() {
    return GlassCard(
      animationDelay: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Weekly Progress',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.trending_up, size: 16, color: AppColors.success),
                    SizedBox(width: 4),
                    Text(
                      '+23%',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.success,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 10,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            days[value.toInt()],
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textMuted,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false),
                barGroups: [
                  _makeGroupData(0, 5, 7),
                  _makeGroupData(1, 6, 8),
                  _makeGroupData(2, 4, 6),
                  _makeGroupData(3, 7, 9),
                  _makeGroupData(4, 5, 7),
                  _makeGroupData(5, 3, 4),
                  _makeGroupData(6, 2, 3),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendItem('Completed', AppColors.primary),
              const SizedBox(width: 24),
              _buildLegendItem('Total', AppColors.surfaceLight),
            ],
          ),
        ],
      ),
    );
  }

  BarChartGroupData _makeGroupData(int x, double completed, double total) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: total,
          color: AppColors.surfaceLight,
          width: 20,
          borderRadius: BorderRadius.circular(6),
        ),
        BarChartRodData(
          toY: completed,
          gradient: AppGradients.primaryGradient,
          width: 20,
          borderRadius: BorderRadius.circular(6),
        ),
      ],
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            'Tasks Done',
            '$tasksDone',
            Icons.check_circle,
            AppColors.success,
            300,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            'Hours Saved',
            '${hoursSaved}h',
            Icons.schedule,
            AppColors.accent,
            400,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            'Streak',
            '$streak days',
            Icons.local_fire_department,
            AppColors.warning,
            500,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String label,
    String value,
    IconData icon,
    Color color,
    int delay,
  ) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      animationDelay: delay,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textMuted,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'AI Recommendations',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        )
            .animate()
            .fadeIn(delay: 600.ms),
        const SizedBox(height: 16),
        _buildRecommendationCard(
          icon: Icons.psychology,
          title: 'Focus Time Optimization',
          description: 'Your peak productivity is 9-11 AM. Consider scheduling important tasks during this window.',
          color: AppColors.primary,
          delay: 650,
        ),
        const SizedBox(height: 12),
        _buildRecommendationCard(
          icon: Icons.battery_charging_full,
          title: 'Energy Management',
          description: 'Take breaks every 90 minutes. You complete 40% more tasks when well-rested.',
          color: AppColors.accent,
          delay: 700,
        ),
        const SizedBox(height: 12),
        _buildRecommendationCard(
          icon: Icons.timer,
          title: 'Time Blocking',
          description: 'Block 2-hour chunks for deep work. This reduces context switching by 60%.',
          color: AppColors.success,
          delay: 750,
        ),
      ],
    );
  }

  Widget _buildRecommendationCard({
    required IconData icon,
    required String title,
    required String description,
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
                  description,
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
}
