import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../widgets/premium_widgets.dart';
import '../services/auth_service.dart';

/// User Profile Screen with settings and account management
class ProfileScreen extends StatefulWidget {
  final VoidCallback onSignOut;

  const ProfileScreen({super.key, required this.onSignOut});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = true;
  
  @override
  void initState() {
    super.initState();
    _loadSettings();
  }
  
  void _loadSettings() {
    final user = AuthService.instance.currentUser;
    if (user != null) {
      setState(() {
        _notificationsEnabled = user.notificationsEnabled;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = AuthService.instance.currentUser;
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: _showEditProfileSheet,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.backgroundGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                
                // Profile header
                _buildProfileHeader(user),
                
                const SizedBox(height: 32),
                
                // Account section
                _buildSectionTitle('Account'),
                const SizedBox(height: 12),
                _buildAccountSection(),
                
                const SizedBox(height: 24),
                
                // Preferences section
                _buildSectionTitle('Preferences'),
                const SizedBox(height: 12),
                _buildPreferencesSection(),
                
                const SizedBox(height: 24),
                
                // Support section
                _buildSectionTitle('Support'),
                const SizedBox(height: 12),
                _buildSupportSection(),
                
                const SizedBox(height: 32),
                
                // Sign out button
                _buildSignOutButton(),
                
                const SizedBox(height: 24),
                
                // App version
                _buildAppVersion(),
                
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(UserProfile? user) {
    return GlassCard(
      animationDelay: 100,
      child: Column(
        children: [
          // Avatar
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              gradient: AppGradients.primaryGradient,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.4),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Center(
              child: Text(
                user?.initials ?? 'U',
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
              .animate()
              .fadeIn(duration: 500.ms)
              .scale(begin: const Offset(0.8, 0.8)),
          
          const SizedBox(height: 16),
          
          // Name
          Text(
            user?.name ?? 'User',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          )
              .animate()
              .fadeIn(delay: 100.ms, duration: 400.ms),
          
          const SizedBox(height: 4),
          
          // Email
          Text(
            user?.email ?? 'user@example.com',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          )
              .animate()
              .fadeIn(delay: 150.ms, duration: 400.ms),
          
          const SizedBox(height: 16),
          
          // Member since
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, size: 16, color: AppColors.primary),
                const SizedBox(width: 6),
                Text(
                  'Member since ${_formatDate(user?.createdAt ?? DateTime.now())}',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
              .animate()
              .fadeIn(delay: 200.ms, duration: 400.ms),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildAccountSection() {
    return GlassCard(
      padding: const EdgeInsets.all(0),
      animationDelay: 200,
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.person_outline,
            title: 'Personal Information',
            onTap: _showEditProfileSheet,
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.security_outlined,
            title: 'Security & Privacy',
            onTap: () {},
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.credit_card_outlined,
            title: 'Subscription',
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                gradient: AppGradients.primaryGradient,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'PRO',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildPreferencesSection() {
    return GlassCard(
      padding: const EdgeInsets.all(0),
      animationDelay: 300,
      child: Column(
        children: [
          _buildSwitchMenuItem(
            icon: Icons.notifications_outlined,
            title: 'Push Notifications',
            value: _notificationsEnabled,
            onChanged: (value) async {
              setState(() => _notificationsEnabled = value);
              await AuthService.instance.updateProfile(
                notificationsEnabled: value,
              );
            },
          ),
          _buildDivider(),
          _buildSwitchMenuItem(
            icon: Icons.dark_mode_outlined,
            title: 'Dark Mode',
            value: _darkModeEnabled,
            onChanged: (value) {
              setState(() => _darkModeEnabled = value);
              // Dark mode is always on for this design
            },
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.language_outlined,
            title: 'Language',
            trailing: const Text(
              'English',
              style: TextStyle(
                color: AppColors.textMuted,
                fontSize: 14,
              ),
            ),
            onTap: () {},
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.schedule_outlined,
            title: 'Timezone',
            trailing: const Text(
              'Auto',
              style: TextStyle(
                color: AppColors.textMuted,
                fontSize: 14,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSupportSection() {
    return GlassCard(
      padding: const EdgeInsets.all(0),
      animationDelay: 400,
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.help_outline,
            title: 'Help Center',
            onTap: () {},
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.feedback_outlined,
            title: 'Send Feedback',
            onTap: () {},
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.info_outline,
            title: 'About LifeSync',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.surfaceLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: AppColors.textSecondary, size: 20),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              if (trailing != null) trailing,
              if (trailing == null)
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.textMuted,
                  size: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchMenuItem({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.textSecondary, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      indent: 56,
      color: AppColors.glassBorder,
    );
  }

  Widget _buildSignOutButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: _confirmSignOut,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.error,
          side: BorderSide(color: AppColors.error.withValues(alpha: 0.5)),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout),
            SizedBox(width: 8),
            Text(
              'Sign Out',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(delay: 500.ms, duration: 400.ms);
  }

  Widget _buildAppVersion() {
    return const Text(
      'LifeSync AI Butler v1.0.0',
      style: TextStyle(
        fontSize: 13,
        color: AppColors.textMuted,
      ),
    )
        .animate()
        .fadeIn(delay: 600.ms, duration: 400.ms);
  }

  void _confirmSignOut() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back from profile
              widget.onSignOut();
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }

  void _showEditProfileSheet() {
    final user = AuthService.instance.currentUser;
    final nameController = TextEditingController(text: user?.name ?? '');
    
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
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
              'Edit Profile',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 20),
            
            // Name field
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                labelStyle: const TextStyle(color: AppColors.textMuted),
                prefixIcon: const Icon(Icons.person_outline, color: AppColors.textMuted),
                filled: true,
                fillColor: AppColors.surfaceLight,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.glassBorder),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.glassBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.primary, width: 2),
                ),
              ),
              style: const TextStyle(color: AppColors.textPrimary),
            ),
            const SizedBox(height: 24),
            
            // Save button
            SizedBox(
              width: double.infinity,
              child: GradientButton(
                text: 'Save Changes',
                icon: Icons.check,
                onPressed: () async {
                  if (nameController.text.isNotEmpty) {
                    await AuthService.instance.updateProfile(
                      name: nameController.text.trim(),
                    );
                    if (mounted) {
                      Navigator.pop(context);
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Profile updated successfully!'),
                          backgroundColor: AppColors.success,
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
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }
}
