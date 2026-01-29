import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../widgets/premium_widgets.dart';
import '../services/api_service.dart';

/// Tasks Management Screen with premium UI
class TasksScreen extends StatefulWidget {
  final int userId;

  const TasksScreen({super.key, required this.userId});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ApiService _api = ApiService.instance;
  final List<_MockTask> _tasks = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    setState(() => _isLoading = true);

    try {
      final tasks = await _api.getUserTasks(widget.userId);
      if (mounted) {
        setState(() {
          _tasks.clear();
          for (final task in tasks) {
            _tasks.add(
              _MockTask(
                task.title,
                task.priority,
                task.dueDate ?? DateTime.now(),
                task.status == 'completed',
                id: task.id,
              ),
            );
          }
          _isLoading = false;
        });
      }
    } catch (e) {
      // Backend not connected, use mock data
      if (mounted) {
        setState(() {
          _tasks.clear();
          _tasks.addAll([
            _MockTask('Review project proposal', 'high', DateTime.now(), true),
            _MockTask(
              'Team standup meeting',
              'medium',
              DateTime.now().add(const Duration(hours: 2)),
              false,
            ),
            _MockTask(
              'Update client presentation',
              'urgent',
              DateTime.now().add(const Duration(hours: 4)),
              false,
            ),
            _MockTask(
              'Code review for feature branch',
              'low',
              DateTime.now().add(const Duration(hours: 6)),
              false,
            ),
            _MockTask(
              'Prepare quarterly report',
              'high',
              DateTime.now().add(const Duration(days: 1)),
              false,
            ),
            _MockTask(
              'Team retrospective',
              'medium',
              DateTime.now().add(const Duration(days: 2)),
              false,
            ),
          ]);
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
          child: Column(
            children: [
              // Header
              _buildHeader(),

              // Tab bar
              _buildTabBar(),

              // Task list
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _loadTasks,
                  color: AppColors.primary,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildTaskList(
                        _tasks.where((t) => !t.isCompleted).toList(),
                      ),
                      _buildTaskList(
                        _tasks.where((t) => t.isCompleted).toList(),
                      ),
                      _buildTaskList(_tasks),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _buildFAB(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                      'My Tasks',
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
                Text(
                  '${_tasks.where((t) => !t.isCompleted).length} pending tasks',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ).animate().fadeIn(delay: 100.ms, duration: 400.ms),
              ],
            ),
          ),

          // Search button
          Container(
                decoration: BoxDecoration(
                  color: AppColors.surfaceLight,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: AppColors.textSecondary,
                  ),
                  onPressed: () {},
                ),
              )
              .animate()
              .fadeIn(delay: 200.ms, duration: 400.ms)
              .scale(begin: const Offset(0.8, 0.8)),
          const SizedBox(width: 8),

          // Filter button
          Container(
                decoration: BoxDecoration(
                  color: AppColors.surfaceLight,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.filter_list,
                    color: AppColors.textSecondary,
                  ),
                  onPressed: () {},
                ),
              )
              .animate()
              .fadeIn(delay: 250.ms, duration: 400.ms)
              .scale(begin: const Offset(0.8, 0.8)),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          gradient: AppGradients.primaryGradient,
          borderRadius: BorderRadius.circular(12),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.textMuted,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        tabs: const [
          Tab(text: 'Pending'),
          Tab(text: 'Completed'),
          Tab(text: 'All'),
        ],
      ),
    ).animate().fadeIn(delay: 300.ms, duration: 400.ms);
  }

  Widget _buildTaskList(List<_MockTask> tasks) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    if (tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 80,
              color: AppColors.textMuted.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 16),
            const Text(
              'No tasks here',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskTile(
          title: task.title,
          priority: task.priority,
          dueDate: task.dueDate,
          isCompleted: task.isCompleted,
          delay: 350 + (index * 50),
          onComplete: () => _toggleTaskComplete(task),
        );
      },
    );
  }

  Future<void> _toggleTaskComplete(_MockTask task) async {
    setState(() {
      task.isCompleted = !task.isCompleted;
    });

    // Try to update on backend
    if (task.id != null) {
      try {
        await _api.completeTask(task.id!);
      } catch (e) {
        // Ignore backend errors
      }
    }
  }

  Widget _buildFAB() {
    return Container(
          decoration: BoxDecoration(
            gradient: AppGradients.primaryGradient,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.4),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: FloatingActionButton.extended(
            heroTag: 'createTaskFab',
            onPressed: () => _showCreateTaskSheet(),
            backgroundColor: Colors.transparent,
            elevation: 0,
            highlightElevation: 0,
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text(
              'New Task',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(delay: 500.ms)
        .scale(begin: const Offset(0.8, 0.8), curve: Curves.easeOutBack);
  }

  void _showCreateTaskSheet() {
    final titleController = TextEditingController();
    String selectedPriority = 'medium';

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setSheetState) => Container(
          padding: EdgeInsets.fromLTRB(
            24,
            24,
            24,
            MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          decoration: const BoxDecoration(
            gradient: AppGradients.cardGradient,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            border: Border(
              top: BorderSide(color: AppColors.glassBorder),
              left: BorderSide(color: AppColors.glassBorder),
              right: BorderSide(color: AppColors.glassBorder),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.textMuted,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                'Create New Task',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 20),

              // Task title input
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Task title',
                  prefixIcon: const Icon(
                    Icons.task_alt,
                    color: AppColors.textMuted,
                  ),
                  filled: true,
                  fillColor: AppColors.surfaceLight,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.glassBorder),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                ),
                style: const TextStyle(color: AppColors.textPrimary),
              ),
              const SizedBox(height: 16),

              // Priority selector
              const Text(
                'Priority',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: ['Low', 'Medium', 'High', 'Urgent'].map((p) {
                  final isSelected = selectedPriority == p.toLowerCase();
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () => setSheetState(
                          () => selectedPriority = p.toLowerCase(),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? _getPriorityColor(p).withValues(alpha: 0.15)
                                : AppColors.surfaceLight,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? _getPriorityColor(p)
                                  : AppColors.glassBorder,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              p,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? _getPriorityColor(p)
                                    : AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),

              // Create button
              SizedBox(
                width: double.infinity,
                child: GradientButton(
                  text: 'Create Task',
                  icon: Icons.add,
                  onPressed: () async {
                    if (titleController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Please enter a task title'),
                          backgroundColor: AppColors.error,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                      return;
                    }

                    Navigator.pop(context);

                    // Try to create on backend first
                    try {
                      final createdTask = await _api.createTask(
                        userId: widget.userId,
                        title: titleController.text,
                        priority: selectedPriority,
                        dueDate: DateTime.now(),
                      );

                      // Add to local list with backend ID
                      setState(() {
                        _tasks.insert(
                          0,
                          _MockTask(
                            createdTask.title,
                            createdTask.priority,
                            createdTask.dueDate ?? DateTime.now(),
                            false,
                            id: createdTask.id,
                          ),
                        );
                      });

                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Task created successfully!'),
                            backgroundColor: AppColors.success,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      // Backend failed, add locally
                      setState(() {
                        _tasks.insert(
                          0,
                          _MockTask(
                            titleController.text,
                            selectedPriority,
                            DateTime.now(),
                            false,
                          ),
                        );
                      });

                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              'Task saved locally (offline mode)',
                            ),
                            backgroundColor: AppColors.warning,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'urgent':
        return AppColors.priorityUrgent;
      case 'high':
        return AppColors.priorityHigh;
      case 'medium':
        return AppColors.priorityMedium;
      default:
        return AppColors.priorityLow;
    }
  }
}

class _MockTask {
  final String title;
  final String priority;
  final DateTime dueDate;
  bool isCompleted;
  final int? id;

  _MockTask(
    this.title,
    this.priority,
    this.dueDate,
    this.isCompleted, {
    this.id,
  });
}
