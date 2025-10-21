import 'package:logistics_website/src/features/admin_page/admin_auth/model/login_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user != null) {
        return UserModel(id: user.id, email: user.email ?? '');
      }
      return null;
    } on AuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<void> logout() async {
    await _client.auth.signOut();
  }

  UserModel? get currentUser {
    final user = _client.auth.currentUser;
    if (user != null) {
      return UserModel(id: user.id, email: user.email ?? '');
    }
    return null;
  }
}
