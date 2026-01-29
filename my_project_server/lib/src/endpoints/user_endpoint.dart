import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// UserEndpoint manages user profiles and preferences for LifeSync.
class UserEndpoint extends Endpoint {
  /// Create or update a user profile
  Future<User> createOrUpdateUser(Session session, User user) async {
    // Check if user exists
    final existing = await User.db.findFirstRow(
      session,
      where: (u) => u.email.equals(user.email),
    );

    if (existing != null) {
      // Update existing user
      user.id = existing.id;
      user.createdAt = existing.createdAt;
      user.lastActiveAt = DateTime.now();
      return await User.db.updateRow(session, user);
    } else {
      // Create new user
      user.createdAt = DateTime.now();
      user.lastActiveAt = DateTime.now();
      return await User.db.insertRow(session, user);
    }
  }

  /// Get user by email
  Future<User?> getUserByEmail(Session session, String email) async {
    return await User.db.findFirstRow(
      session,
      where: (u) => u.email.equals(email),
    );
  }

  /// Get user by ID
  Future<User?> getUserById(Session session, int userId) async {
    return await User.db.findById(session, userId);
  }

  /// Update user's last active timestamp
  Future<void> updateLastActive(Session session, int userId) async {
    final user = await User.db.findById(session, userId);
    if (user != null) {
      user.lastActiveAt = DateTime.now();
      await User.db.updateRow(session, user);
    }
  }

  /// Update user preferences
  Future<User> updatePreferences(
    Session session,
    int userId, {
    String? timezone,
    bool? notificationsEnabled,
  }) async {
    final user = await User.db.findById(session, userId);
    if (user == null) {
      throw Exception('User not found');
    }

    if (timezone != null) user.timezone = timezone;
    if (notificationsEnabled != null) user.notificationsEnabled = notificationsEnabled;

    return await User.db.updateRow(session, user);
  }

  /// Update user avatar
  Future<User> updateAvatar(Session session, int userId, String avatarUrl) async {
    final user = await User.db.findById(session, userId);
    if (user == null) {
      throw Exception('User not found');
    }

    user.avatarUrl = avatarUrl;
    return await User.db.updateRow(session, user);
  }
}
