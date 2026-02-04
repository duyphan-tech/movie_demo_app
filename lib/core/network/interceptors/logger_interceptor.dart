import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoggerInterceptor extends Interceptor {
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';

    debugPrint('❌ [ERROR] ${options.method} ==> $requestPath');
    debugPrint('   Type: ${err.error}, Message: ${err.message}');

    return handler.next(err);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final requestPath = '${options.baseUrl}${options.path}';

    debugPrint('🚀 [REQUEST] ${options.method} ==> $requestPath');

    return handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    debugPrint(
      '✅ [RESPONSE] ${response.statusCode} from ${response.requestOptions.uri}',
    );

    return handler.next(response);
  }
}
