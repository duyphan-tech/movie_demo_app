import 'package:dio/dio.dart';

import 'package:movie_demo_app/core/logger/app_logger.dart';

class LoggerInterceptor extends Interceptor {
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';

    AppLogger.e(
      '[ERROR] ${options.method} ==> $requestPath',
      tag: 'Dio',
      error: err.error,
    );
    AppLogger.e('   Message: ${err.message}', tag: 'Dio');

    return handler.next(err);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final requestPath = '${options.baseUrl}${options.path}';

    AppLogger.d('🚀 [REQUEST] ${options.method} ==> $requestPath', tag: 'Dio');

    return handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    AppLogger.i(
      '✅ [RESPONSE] ${response.statusCode} from ${response.requestOptions.uri}',
      tag: 'Dio',
    );

    return handler.next(response);
  }
}
