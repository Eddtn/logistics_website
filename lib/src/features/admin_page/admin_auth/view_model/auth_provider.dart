// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// /// 🟦 1. Auth State
// class AuthState {
//   final bool isLoading;
//   final User? user;
//   final String? error;

//   const AuthState({this.isLoading = false, this.user, this.error});

//   AuthState copyWith({bool? isLoading, User? user, String? error}) {
//     return AuthState(
//       isLoading: isLoading ?? this.isLoading,
//       user: user ?? this.user,
//       error: error,
//     );
//   }
// }

// /// 🟦 2. Auth Notifier (ViewModel)
// class AuthNotifier extends StateNotifier<AuthState> {
//   AuthNotifier() : super(const AuthState());

//   final supabase = Supabase.instance.client;

//   /// Login with Supabase email + password
//   Future<void> login(String email, String password) async {
//     try {
//       state = state.copyWith(isLoading: true, error: null);

//       final response = await supabase.auth.signInWithPassword(
//         email: email,
//         password: password,
//       );

//       if (response.user != null) {
//         state = state.copyWith(isLoading: false, user: response.user);
//       } else {
//         state = state.copyWith(
//           isLoading: false,
//           error: "Login failed. Please try again.",
//         );
//       }
//     } on AuthException catch (e) {
//       state = state.copyWith(isLoading: false, error: e.message);
//     } catch (e) {
//       state = state.copyWith(isLoading: false, error: e.toString());
//     }
//   }

//   /// Logout
//   Future<void> logout() async {
//     await supabase.auth.signOut();
//     state = const AuthState();
//   }

//   /// Get current session user
//   void checkAuthStatus() {
//     final user = supabase.auth.currentUser;
//     if (user != null) {
//       state = state.copyWith(user: user);
//     }
//   }
// }

// /// 🟦 3. Provider
// final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
//   (ref) => AuthNotifier(),
// );

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:logistics_website/src/features/admin_page/admin_auth/model/login_model.dart';

import '../service/auth_service.dart';

class AuthState {
  final bool isLoading;
  final UserModel? user;
  final String? error;

  AuthState({this.isLoading = false, this.user, this.error});

  AuthState copyWith({bool? isLoading, UserModel? user, String? error}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;

  AuthNotifier(this._authService) : super(AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final user = await _authService.login(email, password);
      if (user != null) {
        state = state.copyWith(user: user, isLoading: false);
      } else {
        state = state.copyWith(error: "Invalid credentials", isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  void logout() async {
    await _authService.logout();
    state = AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authService = AuthService();
  return AuthNotifier(authService);
});
