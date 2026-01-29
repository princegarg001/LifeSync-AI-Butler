import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme/app_theme.dart';
import 'screens/signup_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/tasks_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/insights_screen.dart';
import 'screens/voice_butler_screen.dart';
import 'screens/profile_screen.dart';
import 'services/auth_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LifeSyncApp());
}

class LifeSyncApp extends StatelessWidget {
  const LifeSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifeSync AI Butler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        colorScheme: ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.accent,
          surface: AppColors.surface,
        ),
      ),
      home: const AuthWrapper(),
    );
  }
}

/// Authentication wrapper that manages the auth flow
class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  AuthScreen _currentScreen = AuthScreen.signUp;
  
  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }
  
  Future<void> _checkAuthStatus() async {
    final isAuthenticated = await AuthService.instance.checkAuthStatus();
    if (isAuthenticated && mounted) {
      setState(() {
        _currentScreen = AuthScreen.main;
      });
    }
  }
  
  void _navigateToSignIn() {
    setState(() => _currentScreen = AuthScreen.signIn);
  }
  
  void _navigateToSignUp() {
    setState(() => _currentScreen = AuthScreen.signUp);
  }
  
  void _onSignUpSuccess() {
    // After sign up, go to sign in
    setState(() => _currentScreen = AuthScreen.signIn);
    
    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Account created successfully! Please sign in.'),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
  
  void _onSignInSuccess() {
    setState(() => _currentScreen = AuthScreen.main);
  }
  
  void _onSignOut() {
    AuthService.instance.signOut();
    setState(() => _currentScreen = AuthScreen.signUp);
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case AuthScreen.signUp:
        return SignUpScreen(
          onSignUpSuccess: _onSignUpSuccess,
          onNavigateToSignIn: _navigateToSignIn,
        );
      case AuthScreen.signIn:
        return SignInScreen(
          onSignInSuccess: _onSignInSuccess,
          onNavigateToSignUp: _navigateToSignUp,
        );
      case AuthScreen.main:
        return MainNavigationScreen(onSignOut: _onSignOut);
    }
  }
}

enum AuthScreen { signUp, signIn, main }

/// Main navigation with bottom nav bar
class MainNavigationScreen extends StatefulWidget {
  final VoidCallback onSignOut;
  
  const MainNavigationScreen({super.key, required this.onSignOut});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  
  int get _userId => AuthService.instance.currentUser?.id ?? 1;

  @override
  Widget build(BuildContext context) {
    final screens = [
      DashboardScreen(userId: _userId),
      TasksScreen(userId: _userId),
      ChatScreen(userId: _userId),
      InsightsScreen(userId: _userId),
    ];

    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      floatingActionButton: _buildVoiceButlerFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildVoiceButlerFab() {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppGradients.primaryGradient,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.5),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: FloatingActionButton(
        heroTag: 'voiceButlerFab',
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  VoiceButlerScreen(userId: _userId),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return ScaleTransition(
                  scale: Tween<double>(begin: 0.8, end: 1.0).animate(
                    CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
                  ),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              transitionDuration: const Duration(milliseconds: 400),
            ),
          );
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: const Icon(Icons.mic, color: Colors.white, size: 28),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.95),
        border: const Border(top: BorderSide(color: AppColors.glassBorder)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.dashboard_outlined, Icons.dashboard, 'Home'),
              _buildNavItem(1, Icons.task_alt_outlined, Icons.task_alt, 'Tasks'),
              _buildNavItem(2, Icons.chat_bubble_outline, Icons.chat_bubble, 'Chat'),
              _buildNavItem(3, Icons.insights_outlined, Icons.insights, 'Insights'),
              _buildProfileItem(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, IconData activeIcon, String label) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withValues(alpha: 0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color: isSelected ? AppColors.primary : AppColors.textMuted,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? AppColors.primary : AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem() {
    final user = AuthService.instance.currentUser;
    
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProfileScreen(onSignOut: widget.onSignOut),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                gradient: AppGradients.primaryGradient,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary, width: 2),
              ),
              child: Center(
                child: Text(
                  user?.initials ?? 'U',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Profile',
              style: TextStyle(
                fontSize: 11,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
