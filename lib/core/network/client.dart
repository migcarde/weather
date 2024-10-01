import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Client {
  static const _timeout = Duration(milliseconds: 60000);
  static const Map<String, String> _headers = {
    'Content-Type': 'application/json',
  };

  static final Client _instance = Client._internal();

  factory Client() => _instance;

  static final _dio = Dio();

  Dio get dio => _dio;

  Client._internal();

  void configureInterceptors(List<Interceptor> interceptors) {
    _dio
      ..options.connectTimeout = _timeout
      ..options.receiveTimeout = _timeout
      ..options.headers = _headers
      ..httpClientAdapter;
    if (interceptors.isNotEmpty) {
      _dio.interceptors.addAll(interceptors);
    }
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          responseHeader: false,
        ),
      );
    }
  }
}
