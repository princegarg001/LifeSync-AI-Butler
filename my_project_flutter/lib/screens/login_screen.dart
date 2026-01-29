import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../widgets/premium_widgets.dart';

/// Premium Login Screen with glassmorphism design
class LoginScreen extends StatefulWidget {
  final VoidCallback onLoginSuccess;
  
  const LoginScreen({super.key, required this.onLoginSuccess});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.backgroundGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                
                // Logo and branding
                _buildHeader(),
                
                const SizedBox(height: 48),
                
                // Login form
                _buildLoginForm(),
                
                const SizedBox(height: 24),
                
                // Login button
                GradientButton(
                  text: 'Sign In',
                  icon: Icons.login_rounded,
                  isLoading: _isLoading,
                  onPressed: _handleLogin,
                ),
                
                const SizedBox(height: 20),
                
                // Or divider
                _buildDivider(),
                
                const SizedBox(height: 20),
                
                // Social login buttons
                _buildSocialLogins(),
                
                const SizedBox(height: 32),
                
                // Sign up link
                _buildSignUpLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        // App icon
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            gradient: AppGradients.primaryGradient,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.4),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Icon(
            Icons.auto_awesome,
            size: 50,
            color: Colors.white,
          ),
        )
            .animate()
            .fadeIn(duration: 600.ms)
            .scale(begin: const Offset(0.5, 0.5), curve: Curves.easeOutBack),
        
        const SizedBox(height: 24),
        
        const Text(
          'LifeSync',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            letterSpacing: -1,
          ),
        )
            .animate()
            .fadeIn(delay: 200.ms, duration: 500.ms)
            .slideY(begin: 0.3, end: 0),
        
        const SizedBox(height: 8),
        
        const Text(
          'Your AI-Powered Life Butler',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary,
          ),
        )
            .animate()
            .fadeIn(delay: 300.ms, duration: 500.ms),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        // Email field
        GlassCard(
          padding: EdgeInsets.zero,
          animate: true,
          animationDelay: 400,
          child: TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: InputDecoration(
              hintText: 'Email address',
              hintStyle: const TextStyle(color: AppColors.textMuted),
              prefixIcon: const Icon(Icons.email_outlined, color: AppColors.textSecondary),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            ),
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Password field
        GlassCard(
          padding: EdgeInsets.zero,
          animate: true,
          animationDelay: 500,
          child: TextField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: const TextStyle(color: AppColors.textMuted),
              prefixIcon: const Icon(Icons.lock_outline, color: AppColors.textSecondary),
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.textSecondary,
                ),
                onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            ),
          ),
        ),
        
        const SizedBox(height: 12),
        
        // Forgot password
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Forgot password?',
              style: TextStyle(
                color: AppColors.accent,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
            .animate()
            .fadeIn(delay: 600.ms),
      ],
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.glassBorder,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'or continue with',
            style: TextStyle(color: AppColors.textMuted, fontSize: 13),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.glassBorder,
          ),
        ),
      ],
    )
        .animate()
        .fadeIn(delay: 700.ms);
  }

  Widget _buildSocialLogins() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(Icons.g_mobiledata, 'Google', 800),
        const SizedBox(width: 16),
        _buildSocialButton(Icons.apple, 'Apple', 900),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, String label, int delay) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
      animationDelay: delay,
      onTap: () {
        // For demo, just login
        widget.onLoginSuccess();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.textPrimary, size: 24),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(color: AppColors.textSecondary),
        ),
        TextButton(
          onPressed: () {
            // For demo, just login
            widget.onLoginSuccess();
          },
          child: const Text(
            'Sign up',
            style: TextStyle(
              color: AppColors.accent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    )
        .animate()
        .fadeIn(delay: 1000.ms);
  }

  void _handleLogin() async {
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email')),
      );
      return;
    }
    
    setState(() => _isLoading = true);
    
    // Simulate login delay
    await Future.delayed(const Duration(seconds: 1));
    
    if (mounted) {
      setState(() => _isLoading = false);
      widget.onLoginSuccess();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
