import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final int retryInterval;

  RetryInterceptor({
    required this.dio,
    this.maxRetries = 3,
    this.retryInterval = 1000,
  });

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (_shouldRetry(err)) {
      try {
        final options = err.requestOptions;
        final currentRetry = options.extra['retry_count'] ?? 0;

        if (currentRetry < maxRetries) {
          final nextRetry = currentRetry + 1;
          options.extra['retry_count'] = nextRetry;

          if (kDebugMode) {
            print(
              '[RetryInterceptor] Retrying request... ($nextRetry/$maxRetries)',
            );
          }

          await Future.delayed(Duration(milliseconds: retryInterval));

          final response = await dio.fetch(options);
          return handler.resolve(response);
        }
      } catch (e) {
        return super.onError(err, handler);
      }
    }
    return super.onError(err, handler);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        (err.type == DioExceptionType.unknown &&
            err.error != null &&
            err.error.toString().contains('SocketException'));
  }
}
