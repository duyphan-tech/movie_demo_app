import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/app_constants.dart';
import '../constants/env_config.dart';
import 'interceptors/retry_interceptor.dart';

final basicDioProvider = Provider.autoDispose<Dio>((ref) {
  final dio = Dio();

  dio.options.connectTimeout = const Duration(
    seconds: AppConstants.connectTimeout,
  );
  dio.options.receiveTimeout = const Duration(
    seconds: AppConstants.receiveTimeout,
  );
  dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

  ref.onDispose(() => dio.close());
  return dio;
});

final tmdbDioProvider = Provider.autoDispose<Dio>((ref) {
  final dio = Dio();

  // final baseUrl = dotenv.env['BASE_URL'] ?? 'https://api.themoviedb.org/3';
  // final apiKey = dotenv.env['TMDB_API_KEY'];

  final apiKey = EnvConfig.tmdbApiKey;
  final baseUrl = EnvConfig.tmdbUrl;

  if (apiKey.isEmpty) {
    throw Exception('error config tmdb api key');
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
          'language': 'vi-VN',
        });
        return handler.next(options);
      },
    ),
  );

  dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  dio.interceptors.add(RetryInterceptor(dio: dio));

  ref.onDispose(() => dio.close());
  return dio;
});
