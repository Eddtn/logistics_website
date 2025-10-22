// import 'package:logistics_website/src/features/admin_page/admin_auth/model/login_model.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class AuthService {
//   final SupabaseClient _client = Supabase.instance.client;

//   Future<UserModel?> login(String email, String password) async {
//     try {
//       final response = await _client.auth.signInWithPassword(
//         email: email,
//         password: password,
//       );

//       final user = response.user;
//       if (user != null) {
//         return UserModel(id: user.id, email: user.email ?? '');
//       }
//       return null;
//     } on AuthException catch (e) {
//       throw Exception(e.message);
//     } catch (e) {
//       throw Exception('Unexpected error: $e');
//     }
//   }

//   Future<void> logout() async {
//     await _client.auth.signOut();
//   }

//   UserModel? get currentUser {
//     final user = _client.auth.currentUser;
//     if (user != null) {
//       return UserModel(id: user.id, email: user.email ?? '');
//     }
//     return null;
//   }
// }

// src/features/admin_page/admin_auth/service/auth_service.dart
import 'package:logistics_website/src/features/admin_page/admin_auth/model/login_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:logistics_website/src/service/network_service.dart'; // ← Add this

class AuthService {
  final SupabaseClient _client = Supabase.instance.client;
  final DeliveryNetworkService _network = DeliveryNetworkService(); // ← Add

  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      final session = response.session;

      if (user != null && session != null) {
        // SAVE JWT TOKEN
        await _network.saveAuthToken(session.accessToken);

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
    await _network.clearAuthToken(); // ← Clear token
  }

  UserModel? get currentUser {
    final user = _client.auth.currentUser;
    if (user != null) {
      return UserModel(id: user.id, email: user.email ?? '');
    }
    return null;
  }
}
