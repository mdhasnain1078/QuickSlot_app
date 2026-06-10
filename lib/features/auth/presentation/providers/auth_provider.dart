import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:quickslot/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Initialize this in main.dart');
});

final authProvider = StateNotifierProvider<AuthNotifier, UserModel?>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return AuthNotifier(prefs);
});

class AuthNotifier extends StateNotifier<UserModel?> {
  final SharedPreferences _prefs;

  AuthNotifier(this._prefs) : super(null) {
    _loadUser();
  }

  void _loadUser() {
    final id = _prefs.getString('user_id');
    final name = _prefs.getString('user_name');
    if (id != null && name != null) {
      state = UserModel(id: id, name: name);
    }
  }

  Future<void> login(UserModel user) async {
    await _prefs.setString('user_id', user.id);
    await _prefs.setString('user_name', user.name);
    state = user;
  }

  Future<void> logout() async {
    await _prefs.remove('user_id');
    await _prefs.remove('user_name');
    state = null;
  }
}

// Dummy users for selection
final dummyUsers = [
  const UserModel(id: 'user1_id', name: 'User 1'),
  const UserModel(id: 'user2_id', name: 'User 2'),
  const UserModel(id: 'user3_id', name: 'User 3'),
];
