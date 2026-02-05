import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/app_constants.dart';
import '../constants/env_config.dart';
import '../network/api_client.dart';
import '../network/interceptors/logger_interceptor.dart';
import '../network/interceptors/retry_interceptor.dart';
import '../network/network_info.dart';

final networkInfoProvider = Provider<NetworkInfo>((ref) => NetworkInfoImpl());

final loggerInterceptorProvider = Provider<LoggerInterceptor>((ref) {
  return LoggerInterceptor();
});

final retryInterceptorProvider = Provider.family<RetryInterceptor, Dio>((
  ref,
  dio,
) {
  return RetryInterceptor(
    dio: dio,
    maxRetries: 3,
    retryDelays: const [
      Duration(seconds: 1),
      Duration(seconds: 2),
      Duration(seconds: 3),
    ],
  );
});

final tmdbDioProvider = Provider.autoDispose<Dio>((ref) {
  final dio = Dio();

  final apiKey = EnvConfig.tmdbApiKey;
  final baseUrl = EnvConfig.tmdbUrl;

  if (apiKey.isEmpty) {
    throw Exception('Error: Config TMDB API Key is empty');
  }

  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = const Duration(
    seconds: AppConstants.connectTimeout,
  );
  dio.options.receiveTimeout = const Duration(
    seconds: AppConstants.receiveTimeout,
  );
  dio.options.headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.queryParameters.addAll({
          'api_key': apiKey,
          'language': 'en-US',
        });
        return handler.next(options);
      },
    ),
  );

  dio.interceptors.add(ref.watch(loggerInterceptorProvider));

  final retryInterceptor = ref.read(retryInterceptorProvider(dio));
  dio.interceptors.add(retryInterceptor);

  ref.onDispose(() => dio.close());

  return dio;
});

final basicDioProvider = Provider.autoDispose<Dio>((ref) {
  final dio = Dio();

  dio.options.baseUrl = EnvConfig.reqresUrl;
  dio.options.connectTimeout = const Duration(seconds: AppConstants.connectTimeout);
  dio.options.receiveTimeout = const Duration(seconds: AppConstants.receiveTimeout);

  dio.options.headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      options.headers['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36';

      if (options.headers.containsKey('Authorization')) {
        options.headers.remove('Authorization');
      }

      print('🔍 [FINAL DEBUG] Headers gửi đi: ${options.headers}');

      return handler.next(options);
    },
  ));

  dio.interceptors.add(ref.watch(loggerInterceptorProvider));
  dio.interceptors.add(ref.read(retryInterceptorProvider(dio)));

  ref.onDispose(() => dio.close());
  return dio;
});

final tmdbApiClientProvider = Provider<ApiClient>((ref) {
  final dio = ref.watch(tmdbDioProvider);
  return ApiClient(dio);
});

final basicApiClientProvider = Provider<ApiClient>((ref) {
  final dio = ref.watch(basicDioProvider);
  return ApiClient(dio);
});
