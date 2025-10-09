// // import 'dart:developer';
// // import 'package:dio/dio.dart';
// // import 'package:logistics_website/src/service/network_service.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class AuthService {
// //   final String baseUrl = "https://production.khairfoundations.com/api/v1";
// //   final NetworkService _networkService = NetworkService();

// //   Future<Map<String, dynamic>> logIn(String email, String password) async {
// //     final response = await _networkService.postRequest('/auth/login', {
// //       'email': email,
// //       'password': password,
// //     }, headers: {});
// //     log('response from login => $response');
// //     // log(response);

// //     return response;
// //   }

// //   Future<void> logOut() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     await prefs.remove("auth_token");
// //   }

// //   // **Save Auth Token after Login**
// //   Future<void> _saveAuthToken(String token) async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     await prefs.setString('auth_token', token);
// //   }
// // }

// import 'dart:developer';
// import 'package:logistics_website/src/service/network_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthService {
//   final NetworkService _networkService = NetworkService();

//   /// -------------------------
//   /// LOGIN with Supabase Auth
//   /// -------------------------
//   Future<Map<String, dynamic>> logIn(String email, String password) async {
//     final response = await _networkService.postRequest(
//       "/auth/v1/token?grant_type=password", // Supabase email+password login endpoint
//       {"email": email, "password": password},
//       headers: {"Content-Type": "application/json"},
//     );

//     log("Response from Supabase login => $response");

//     if (response != null && response['access_token'] != null) {
//       await _saveAuthToken(response['access_token']);
//     }

//     return response;
//   }

//   /// -------------------------
//   /// SIGNUP with Supabase Auth
//   /// -------------------------
//   Future<Map<String, dynamic>> signUp(String email, String password) async {
//     final response = await _networkService.postRequest(
//       "/auth/v1/signup",
//       {"email": email, "password": password},
//       headers: {"Content-Type": "application/json"},
//     );

//     log("Response from Supabase signup => $response");

//     if (response != null && response['access_token'] != null) {
//       await _saveAuthToken(response['access_token']);
//     }

//     return response;
//   }

//   /// -------------------------
//   /// LOGOUT (Clear Local Token)
//   /// -------------------------
//   Future<void> logOut() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove("auth_token");
//   }

//   /// -------------------------
//   /// GET CURRENT USER
//   /// -------------------------
//   Future<Map<String, dynamic>> getCurrentUser() async {
//     final response = await _networkService.getRequest(
//       "/auth/v1/user",
//       requiresAuth: true,
//     );

//     log("Current User => $response");
//     return response;
//   }

//   /// -------------------------
//   /// PRIVATE - Save Token
//   /// -------------------------
//   Future<void> _saveAuthToken(String token) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString("auth_token", token);
//   }
// }

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
