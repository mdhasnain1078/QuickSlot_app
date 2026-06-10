import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;

String getBaseUrl() {
  // Pointing to the live Render backend!
  return 'https://quickslot-backend-g4ed.onrender.com/api/v1';
}

class ApiClient {
  late final Dio _dio;

  ApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: getBaseUrl(),
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ));

    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      logPrint: (obj) {
        if (kDebugMode) {
          print(obj);
        }
      },
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // You can attach X-User-Id here if needed, but we will pass it per request or via a global state
        return handler.next(options);
      },
      onError: (DioException e, handler) {
        // Custom error handling mapping
        return handler.next(e);
      },
    ));
  }

  Dio get dio => _dio;
}

final apiClient = ApiClient();
