import 'package:fpdart/fpdart.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import '../errors/failures.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  Future<Either<Failure, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(_handleError(e));
    }
  }

  Future<Either<Failure, dynamic>> post(String path, {dynamic data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(_handleError(e));
    }
  }

  Future<Either<Failure, dynamic>> put(String path, {dynamic data}) async {
    try {
      final response = await _dio.put(path, data: data);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(_handleError(e));
    }
  }

  Future<Either<Failure, dynamic>> delete(String path) async {
    try {
      final response = await _dio.delete(path);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(_handleError(e));
    }
  }

  Failure _handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ServerFailure(message: 'Connection timeout');

      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;

        final dynamic data = e.response?.data;
        String? serverMessage;

        if (data is Map<String, dynamic>) {
          serverMessage =
              data['message'] ?? data['error'] ?? data['status_message'];
        } else if (data is String) {
          serverMessage = data.length > 100
              ? '${data.substring(0, 100)}...'
              : data;
        }

        switch (statusCode) {
          case 400:
            return ServerFailure(message: serverMessage ?? 'Bad Request');
          case 401:
            return UnauthorizedFailure(
              message: serverMessage ?? 'Unauthorized',
            );
          case 403:
            return ServerFailure(message: serverMessage ?? 'Forbidden');
          case 404:
            return ServerFailure(message: serverMessage ?? 'Not Found');
          case 500:
          case 501:
          case 502:
          case 503:
            return ServerFailure(message: serverMessage ?? 'Server Error');
          default:
            return ServerFailure(
              message: serverMessage ?? 'Unknown error occurred ($statusCode)',
            );
        }

      case DioExceptionType.cancel:
        return const ServerFailure(message: 'Request cancelled');

      case DioExceptionType.unknown:
        if (e.error.toString().contains('SocketException')) {
          return const ServerFailure(message: 'No internet connection');
        }
        return const ServerFailure(message: 'Unknown error occurred');

      default:
        return const ServerFailure(message: 'Unknown error occurred');
    }
  }

  void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void removeToken() {
    _dio.options.headers.remove('Authorization');
  }
}
