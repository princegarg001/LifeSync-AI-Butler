import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:my_project_client/my_project_client.dart';
import 'api_service.dart';

/// User profile model for the app
class UserProfile {
  final int id;
  final String name;
  final String email;
  final String? avatarUrl;
  final DateTime createdAt;
  final String? timezone;
  final bool notificationsEnabled;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
    required this.createdAt,
    this.timezone,
    this.notificationsEnabled = true,
  });

  /// Get initials for avatar
  String get initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }

  /// Get first name
  String get firstName => name.split(' ').first;

  /// Create from backend User model
  factory UserProfile.fromUser(User user) {
    return UserProfile(
      id: user.id ?? 0,
      name: user.name,
      email: user.email,
      avatarUrl: user.avatarUrl,
      createdAt: user.createdAt,
      timezone: user.timezone,
      notificationsEnabled: user.notificationsEnabled ?? true,
    );
  }
}

/// Authentication service for managing user sessions
class AuthService extends ChangeNotifier {
  static AuthService? _instance;

  UserProfile? _currentUser;
  bool _isAuthenticated = false;
  bool _isLoading = false;

  // In-memory storage for demo (in production, use secure storage)
  final Map<String, Map<String, dynamic>> _users = {};
  String? _savedEmail;

  AuthService._internal();

  static AuthService get instance {
    _instance ??= AuthService._internal();
    return _instance!;
  }

  UserProfile? get currentUser => _currentUser;
  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;

  /// Check if user is already logged in
  Future<bool> checkAuthStatus() async {
    // For demo, check if we have a saved session
    // In production, check secure storage / tokens
    return _isAuthenticated;
  }

  /// Get saved email for "remember me" feature
  Future<String?> getSavedEmail() async {
    return _savedEmail;
  }

  /// Sign up with email and password
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 800));

      // Check if email already exists
      if (_users.containsKey(email.toLowerCase())) {
        throw Exception('An account with this email already exists');
      }

      // Create user in backend
      try {
        final user = User(
          email: email,
          name: name,
          createdAt: DateTime.now(),
          lastActiveAt: DateTime.now(),
          notificationsEnabled: true,
        );

        final createdUser = await ApiService.instance.createOrUpdateUser(user);

        // Store locally
        _users[email.toLowerCase()] = {
          'name': name,
          'email': email,
          'password': password,
          'id': createdUser.id ?? DateTime.now().millisecondsSinceEpoch,
          'createdAt': DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // Backend not available, store locally for demo
        _users[email.toLowerCase()] = {
          'name': name,
          'email': email,
          'password': password,
          'id': DateTime.now().millisecondsSinceEpoch,
          'createdAt': DateTime.now().toIso8601String(),
        };
      }

      debugPrint('User signed up: $email');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Sign in with email and password
  Future<void> signIn({
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 800));

      final userData = _users[email.toLowerCase()];

      if (userData == null) {
        throw Exception(
          'No account found with this email. Please sign up first.',
        );
      }

      if (userData['password'] != password) {
        throw Exception('Incorrect password. Please try again.');
      }

      // Create user profile
      _currentUser = UserProfile(
        id: userData['id'] as int,
        name: userData['name'] as String,
        email: userData['email'] as String,
        createdAt: DateTime.parse(userData['createdAt'] as String),
      );

      _isAuthenticated = true;

      if (rememberMe) {
        _savedEmail = email;
      }

      // Update last login on backend
      try {
        await ApiService.instance.getUserByEmail(email);
      } catch (e) {
        // Ignore backend errors
      }

      notifyListeners();
      debugPrint('User signed in: $email');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Sign in with Google
  Future<void> signInWithGoogle() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simulate OAuth flow delay
      await Future.delayed(const Duration(milliseconds: 1200));

      // Create mock Google user
      final mockEmail =
          'user_${DateTime.now().millisecondsSinceEpoch}@gmail.com';
      final mockName = 'Google User';

      // Store user
      _users[mockEmail.toLowerCase()] = {
        'name': mockName,
        'email': mockEmail,
        'password': 'google_oauth',
        'id': DateTime.now().millisecondsSinceEpoch,
        'createdAt': DateTime.now().toIso8601String(),
        'provider': 'google',
      };

      // Try to create in backend
      try {
        final user = User(
          email: mockEmail,
          name: mockName,
          createdAt: DateTime.now(),
          lastActiveAt: DateTime.now(),
          notificationsEnabled: true,
        );
        await ApiService.instance.createOrUpdateUser(user);
      } catch (e) {
        // Ignore backend errors for demo
      }

      _currentUser = UserProfile(
        id: DateTime.now().millisecondsSinceEpoch,
        name: mockName,
        email: mockEmail,
        createdAt: DateTime.now(),
      );

      _isAuthenticated = true;
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Sign in with Apple
  Future<void> signInWithApple() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simulate OAuth flow delay
      await Future.delayed(const Duration(milliseconds: 1200));

      // Create mock Apple user
      final mockEmail =
          'user_${DateTime.now().millisecondsSinceEpoch}@icloud.com';
      final mockName = 'Apple User';

      // Store user
      _users[mockEmail.toLowerCase()] = {
        'name': mockName,
        'email': mockEmail,
        'password': 'apple_oauth',
        'id': DateTime.now().millisecondsSinceEpoch,
        'createdAt': DateTime.now().toIso8601String(),
        'provider': 'apple',
      };

      // Try to create in backend
      try {
        final user = User(
          email: mockEmail,
          name: mockName,
          createdAt: DateTime.now(),
          lastActiveAt: DateTime.now(),
          notificationsEnabled: true,
        );
        await ApiService.instance.createOrUpdateUser(user);
      } catch (e) {
        // Ignore backend errors for demo
      }

      _currentUser = UserProfile(
        id: DateTime.now().millisecondsSinceEpoch,
        name: mockName,
        email: mockEmail,
        createdAt: DateTime.now(),
      );

      _isAuthenticated = true;
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Sign out
  Future<void> signOut() async {
    _isLoading = true;
    notifyListeners();

    try {
      await Future.delayed(const Duration(milliseconds: 300));

      _currentUser = null;
      _isAuthenticated = false;

      notifyListeners();
      debugPrint('User signed out');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Update user profile
  Future<void> updateProfile({
    String? name,
    String? avatarUrl,
    String? timezone,
    bool? notificationsEnabled,
  }) async {
    if (_currentUser == null) return;

    _isLoading = true;
    notifyListeners();

    try {
      await Future.delayed(const Duration(milliseconds: 500));

      _currentUser = UserProfile(
        id: _currentUser!.id,
        name: name ?? _currentUser!.name,
        email: _currentUser!.email,
        avatarUrl: avatarUrl ?? _currentUser!.avatarUrl,
        createdAt: _currentUser!.createdAt,
        timezone: timezone ?? _currentUser!.timezone,
        notificationsEnabled:
            notificationsEnabled ?? _currentUser!.notificationsEnabled,
      );

      // Update in local storage
      final userData = _users[_currentUser!.email.toLowerCase()];
      if (userData != null) {
        userData['name'] = _currentUser!.name;
      }

      // Try to update in backend
      try {
        await ApiService.instance.updatePreferences(
          _currentUser!.id,
          timezone: timezone,
          notificationsEnabled: notificationsEnabled,
        );
      } catch (e) {
        // Ignore backend errors
      }

      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
