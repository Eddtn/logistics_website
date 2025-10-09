// import 'dart:async';
// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class NetworkService {
//   static final Dio _dio =
//       Dio(
//           BaseOptions(
//             baseUrl: "https://production.khairfoundations.com/api/v1",
//             connectTimeout: const Duration(seconds: 20),
//             receiveTimeout: const Duration(seconds: 20),
//             headers: {'Accept': 'application/json'},
//           ),
//         )
//         ..interceptors.add(
//           InterceptorsWrapper(
//             onRequest: (options, handler) async {
//               if (options.extra['requiresAuth'] == true) {
//                 SharedPreferences prefs = await SharedPreferences.getInstance();
//                 String? token = prefs.getString('auth_token');
//                 if (token != null &&
//                     !options.headers.containsKey('Authorization')) {
//                   options.headers["Authorization"] = "Bearer $token";
//                 }
//               }
//               handler.next(options);
//             },
//           ),
//         );

//   /// **GET REQUEST**
//   Future<dynamic> getRequest(
//     String endpoint, {
//     bool requiresAuth = false,
//   }) async {
//     try {
//       Response response = await _dio.get(
//         endpoint,
//         options: Options(extra: {'requiresAuth': requiresAuth}),
//       );
//       return _handleResponse(response);
//     } on DioException catch (error) {
//       throw _handleDioError(error);
//     }
//   }

//   /// **POST REQUEST**
//   Future<dynamic> postRequest(
//     String endpoint,
//     dynamic data, {
//     bool requiresAuth = false,
//     Map<String, String>? headers,
//   }) async {
//     try {
//       Response response = await _dio.post(
//         endpoint,
//         data: data,
//         options: Options(
//           headers: headers ?? {},
//           extra: {'requiresAuth': requiresAuth},
//         ),
//       );
//       return _handleResponse(response);
//     } on DioException catch (error) {
//       throw _handleDioError(error);
//     }
//   }

//   /// **PUT REQUEST**
//   Future<dynamic> putRequest(
//     String endpoint,
//     Map<String, dynamic> data, {
//     bool requiresAuth = false,
//   }) async {
//     try {
//       Response response = await _dio.put(
//         endpoint,
//         data: data,
//         options: Options(extra: {'requiresAuth': requiresAuth}),
//       );
//       return _handleResponse(response);
//     } on DioException catch (error) {
//       throw _handleDioError(error);
//     }
//   }

//   /// **DELETE REQUEST**
//   Future<dynamic> deleteRequest(
//     String endpoint, {
//     bool requiresAuth = false,
//   }) async {
//     try {
//       Response response = await _dio.delete(
//         endpoint,
//         options: Options(extra: {'requiresAuth': requiresAuth}),
//       );
//       return _handleResponse(response);
//     } on DioException catch (error) {
//       throw _handleDioError(error);
//     }
//   }

//   /// **Handle API Response**
//   dynamic _handleResponse(Response response) {
//     log('RESPONSE => ${response.data}');
//     switch (response.statusCode) {
//       case 200:
//       case 201:
//         return response.data;
//       case 400:
//         throw Exception("Bad Request: ${response.data['message']}");
//       case 401:
//         throw Exception("Unauthorized: Please log in again.");
//       case 403:
//         throw Exception("Forbidden: You don’t have permission.");
//       case 404:
//         throw Exception("Not Found: ${response.data['message']}");
//       case 500:
//         throw Exception("Server Error: Try again later.");
//       default:
//         throw Exception("Unexpected Error: ${response.statusMessage}");
//     }
//   }

//   /// **Handle Dio Errors**
//   String _handleDioError(DioException error) {
//     if (error.response != null) {
//       return "Error ${error.response?.statusCode}: ${error.response?.data['message'] ?? 'Something went wrong'}";
//     } else if (error.type == DioExceptionType.connectionTimeout) {
//       return "Connection Timeout. Check your internet.";
//     } else if (error.type == DioExceptionType.receiveTimeout) {
//       return "Server is taking too long to respond.";
//     } else if (error.type == DioExceptionType.badCertificate ||
//         error.type == DioExceptionType.badResponse) {
//       return "Invalid server response.";
//     } else if (error.type == DioExceptionType.unknown) {
//       return "Unknown error occurred.";
//     }
//     return "Unexpected error: ${error.message}";
//   }

//   /// **Save Auth Token after Login**
//   Future<void> saveAuthToken(String token) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('auth_token', token); // Fixed: Store actual token
//   }

//   /// **Retrieve Auth Token**
//   Future<String?> getAuthToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('auth_token');
//   }

//   /// **Remove Token on Logout**
//   Future<void> clearAuthToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('auth_token');
//     _dio.options.headers.remove("Authorization");
//   }
// }

import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkService {
  static const String supabaseUrl = "https://kzeymxnrejtjfmadfurb.supabase.co";
  static const String supabaseAnonKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt6ZXlteG5yZWp0amZtYWRmdXJiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk1MjM1OTcsImV4cCI6MjA3NTA5OTU5N30.QpuUzEffmte3ZO9-6CMK4PwWFP9nBtFWJ-W0e5g91A0"; // from Supabase project settings

  static final Dio _dio =
      Dio(
          BaseOptions(
            baseUrl: supabaseUrl,
            connectTimeout: const Duration(seconds: 20),
            receiveTimeout: const Duration(seconds: 20),
            headers: {
              'Accept': 'application/json',
              'apikey':
                  supabaseAnonKey, // Supabase requires API key in every request
            },
          ),
        )
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) async {
              if (options.extra['requiresAuth'] == true) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String? token = prefs.getString('auth_token');
                if (token != null &&
                    !options.headers.containsKey('Authorization')) {
                  options.headers["Authorization"] = "Bearer $token";
                }
              }
              handler.next(options);
            },
          ),
        );

  /// -------------------------------
  /// GENERIC HTTP METHODS
  /// -------------------------------

  Future<dynamic> getRequest(
    String endpoint, {
    bool requiresAuth = false,
    Map<String, String>? headers,
  }) async {
    try {
      Response response = await _dio.get(
        endpoint,
        options: Options(
          headers: headers ?? {},
          extra: {'requiresAuth': requiresAuth},
        ),
      );
      return _handleResponse(response);
    } on DioException catch (error) {
      throw _handleDioError(error);
    }
  }

  Future<dynamic> postRequest(
    String endpoint,
    dynamic data, {
    bool requiresAuth = false,
    Map<String, String>? headers,
  }) async {
    try {
      Response response = await _dio.post(
        endpoint,
        data: data,
        options: Options(
          headers: headers ?? {},
          extra: {'requiresAuth': requiresAuth},
        ),
      );
      return _handleResponse(response);
    } on DioException catch (error) {
      throw _handleDioError(error);
    }
  }

  Future<dynamic> putRequest(
    String endpoint,
    Map<String, dynamic> data, {
    bool requiresAuth = false,
    Map<String, String>? headers,
  }) async {
    try {
      Response response = await _dio.put(
        endpoint,
        data: data,
        options: Options(
          headers: headers ?? {},
          extra: {'requiresAuth': requiresAuth},
        ),
      );
      return _handleResponse(response);
    } on DioException catch (error) {
      throw _handleDioError(error);
    }
  }

  Future<dynamic> deleteRequest(
    String endpoint, {
    bool requiresAuth = false,
    Map<String, String>? headers,
  }) async {
    try {
      Response response = await _dio.delete(
        endpoint,
        options: Options(
          headers: headers ?? {},
          extra: {'requiresAuth': requiresAuth},
        ),
      );
      return _handleResponse(response);
    } on DioException catch (error) {
      throw _handleDioError(error);
    }
  }

  /// -------------------------------
  /// SUPABASE HELPERS
  /// -------------------------------

  Future<List<dynamic>> getShipments() async {
    return await getRequest("/shipments?select=*", requiresAuth: true);
  }

  Future<dynamic> addShipment(Map<String, dynamic> shipment) async {
    return await postRequest("/shipments", shipment, requiresAuth: true);
  }

  Future<dynamic> updateShipmentStatus(int shipmentId, String status) async {
    return await putRequest("/shipments?id=eq.$shipmentId", {
      "status": status,
    }, requiresAuth: true);
  }

  Future<dynamic> deleteShipment(int shipmentId) async {
    return await deleteRequest(
      "/shipments?id=eq.$shipmentId",
      requiresAuth: true,
    );
  }

  Future<List<dynamic>> getUsers() async {
    return await getRequest(
      "/users?select=id,name,email,role,status,created_at",
      requiresAuth: true,
    );
  }

  /// -------------------------------
  /// PRIVATE HELPERS
  /// -------------------------------

  dynamic _handleResponse(Response response) {
    log('RESPONSE => ${response.data}');
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw Exception("Bad Request: ${response.data['message']}");
      case 401:
        throw Exception("Unauthorized: Please log in again.");
      case 403:
        throw Exception("Forbidden: You don’t have permission.");
      case 404:
        throw Exception("Not Found: ${response.data['message']}");
      case 500:
        throw Exception("Server Error: Try again later.");
      default:
        throw Exception("Unexpected Error: ${response.statusMessage}");
    }
  }

  String _handleDioError(DioException error) {
    if (error.response != null) {
      return "Error ${error.response?.statusCode}: ${error.response?.data['message'] ?? 'Something went wrong'}";
    } else if (error.type == DioExceptionType.connectionTimeout) {
      return "Connection Timeout. Check your internet.";
    } else if (error.type == DioExceptionType.receiveTimeout) {
      return "Server is taking too long to respond.";
    } else if (error.type == DioExceptionType.badCertificate ||
        error.type == DioExceptionType.badResponse) {
      return "Invalid server response.";
    } else if (error.type == DioExceptionType.unknown) {
      return "Unknown error occurred.";
    }
    return "Unexpected error: ${error.message}";
  }

  /// -------------------------------
  /// AUTH TOKEN STORAGE
  /// -------------------------------

  Future<void> saveAuthToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<String?> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<void> clearAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    _dio.options.headers.remove("Authorization");
  }
}
