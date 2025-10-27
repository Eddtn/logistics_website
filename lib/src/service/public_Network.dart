// // src/service/public_network_service.dart
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class PublicNetworkService {
//   final Dio _dio;

//   PublicNetworkService() : _dio = Dio() {
//     // 1. ALWAYS use the anon key for public reads
//     final anonKey =
//         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt6ZXlteG5yZWp0amZtYWRmdXJiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk1MjM1OTcsImV4cCI6MjA3NTA5OTU5N30.QpuUzEffmte3ZO9-6CMK4PwWFP9nBtFWJ-W0e5g91A0"; // <-- anon key
//     final baseUrl = "https://kzeymxnrejtjfmadfurb.supabase.co/rest/v1";
//     // e.g. https://xyz.supabase.co

//     _dio.options
//       ..baseUrl = '$baseUrl/rest/v1'
//       ..headers = {
//         'apikey': anonKey,
//         // No Authorization header → public request
//       };

//     // (optional) log the exact URL
//     _dio.interceptors.add(
//       LogInterceptor(
//         requestBody: true,
//         responseBody: true,
//         logPrint: (o) => debugPrint('[PublicDio] $o'),
//       ),
//     );
//   }

//   // static final Dio _dio =
//   //     Dio(
//   //         BaseOptions(
//   //           baseUrl:
//   //               "https://kzeymxnrejtjfmadfurb.supabase.co/rest/v1", // ✅ fixed
//   //           connectTimeout: const Duration(seconds: 20),
//   //           receiveTimeout: const Duration(seconds: 20),
//   //           headers: {
//   //             'apikey':
//   //                 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt6ZXlteG5yZWp0amZtYWRmdXJiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk1MjM1OTcsImV4cCI6MjA3NTA5OTU5N30.QpuUzEffmte3ZO9-6CMK4PwWFP9nBtFWJ-W0e5g91A0',
//   //           },
//   //         ),
//   //       )
//   //       ..interceptors.add(
//   //         InterceptorsWrapper(
//   //           // In the interceptor
//   //           onRequest: (options, handler) async {

//   //             handler.next(options);
//   //           },
//   //         ),
//   //       );

//   // --------------------------------------------------------------
//   // Same getRequest signature you already use
//   // --------------------------------------------------------------
//   Future<dynamic> getRequest(
//     String table, {
//     Map<String, dynamic>? queryParams,
//     String? singleBy,
//     dynamic value,
//   }) async {
//     try {
//       final Map<String, dynamic> pgParams = {};

//       if (queryParams != null) {
//         queryParams.forEach((k, v) {
//           if (v == null) return;
//           pgParams[k] = v is String && v.startsWith('eq.') ? v : 'eq.$v';
//         });
//       }

//       if (singleBy != null && value != null && value.toString().isNotEmpty) {
//         pgParams[singleBy] = 'eq.${value.toString().trim()}';
//       }

//       final resp = await _dio.get(
//         '/$table',
//         queryParameters: pgParams.isNotEmpty ? pgParams : null,
//       );
//       return resp.data;
//     } on DioException catch (e) {
//       throw Exception(
//         'Public API error ${e.response?.statusCode}: ${e.message}',
//       );
//     }
//   }
// }
