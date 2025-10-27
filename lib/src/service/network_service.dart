import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeliveryNetworkService {
  static final Dio _dio =
      Dio(
          BaseOptions(
            baseUrl:
                "https://kzeymxnrejtjfmadfurb.supabase.co/rest/v1", // ✅ fixed
            connectTimeout: const Duration(seconds: 20),
            receiveTimeout: const Duration(seconds: 20),
            headers: {
              'apikey':
                  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt6ZXlteG5yZWp0amZtYWRmdXJiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk1MjM1OTcsImV4cCI6MjA3NTA5OTU5N30.QpuUzEffmte3ZO9-6CMK4PwWFP9nBtFWJ-W0e5g91A0',
              'Authorization':
                  'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt6ZXlteG5yZWp0amZtYWRmdXJiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk1MjM1OTcsImV4cCI6MjA3NTA5OTU5N30.QpuUzEffmte3ZO9-6CMK4PwWFP9nBtFWJ-W0e5g91A0', // ✅ always send anon key
              'Accept': 'application/json',
            },
          ),
        )
        ..interceptors.add(
          InterceptorsWrapper(
            // In the interceptor
            onRequest: (options, handler) async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String? token = prefs.getString('supabase_token');

              // PRIORITIZE saved token, fallback to anon ONLY if no token
              options.headers["Authorization"] = token != null
                  ? "Bearer $token"
                  : "Bearer ${options.headers['Authorization']?.toString().split(' ').last}";

              handler.next(options);
            },
          ),
        );

  /// ✅ GET Request
  // Future<dynamic> getRequest(
  //   String table, {
  //   Map<String, dynamic>? queryParams,
  // }) async {
  //   try {
  //     final response = await _dio.get('/$table', queryParameters: queryParams);
  //     return _handleResponse(response);
  //   } on DioException catch (e) {
  //     throw Exception(_handleDioError(e));
  //   }
  // }

  Future<dynamic> getRequest(
    String table, {
    Map<String, dynamic>? queryParams,
    String? singleBy, // column name for .eq. filter
    dynamic value, // value for the .eq. filter
  }) async {
    try {
      // ------------------------------------------------------------------
      // 1. Build the PostgREST query map
      // ------------------------------------------------------------------
      final Map<String, dynamic> pgParams = {};

      // ---- a) normal filters (status=eq.in transit, etc.) ----------------
      if (queryParams != null) {
        queryParams.forEach((key, val) {
          // If the caller already passed "eq.xxx" we keep it unchanged
          if (val is String && val.startsWith('eq.')) {
            pgParams[key] = val;
          } else {
            pgParams[key] = 'eq.$val';
          }
        });
      }

      // ---- b) single-row shortcut (tracking_number=eq.TRK123) ------------
      if (singleBy != null && value != null) {
        pgParams[singleBy] = 'eq.$value';
      }

      // ------------------------------------------------------------------
      // 2. Execute request
      // ------------------------------------------------------------------
      final response = await _dio.get(
        '/$table',
        queryParameters: pgParams.isNotEmpty ? pgParams : null,
      );

      return _handleResponse(response);
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  /// ✅ POST Request
  Future<dynamic> postRequest(String table, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('/$table', data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  /// ✅ PATCH Request
  Future<dynamic> updateRequest(
    String table,
    Map<String, dynamic> data, {
    required String matchColumn,
    required dynamic matchValue,
  }) async {
    try {
      final response = await _dio.patch(
        '/$table',
        data: data,
        queryParameters: {matchColumn: 'eq.$matchValue'},
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  /// ✅ DELETE Request
  Future<dynamic> deleteRequest(
    String table, {
    required String matchColumn,
    required dynamic matchValue,
  }) async {
    try {
      final response = await _dio.delete(
        '/$table',
        queryParameters: {matchColumn: 'eq.$matchValue'},
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  dynamic _handleResponse(Response response) {
    log('🔹 Response: ${response.data}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    }
    throw Exception("Error: ${response.statusMessage}");
  }

  String _handleDioError(DioException error) {
    if (error.response != null) {
      return "Error ${error.response?.statusCode}: ${error.response?.data}";
    }
    return "Network error: ${error.message}";
  }

  Future<void> saveAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('supabase_token', token);
  }

  Future<void> clearAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('supabase_token');
  }
}
