import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_demo_app/core/configs/env_config.dart';
import 'package:movie_demo_app/features/movies/data/models/account_state_model.dart';
import 'package:movie_demo_app/features/movies/data/models/review_model.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/endpoints.dart';
import '../../../../core/providers/network_providers.dart';
import '../models/movie_detail_model.dart';
import '../models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<Either<Failure, List<MovieModel>>> getPopularMovies({int page = 1});

  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies();

  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies();

  Future<Either<Failure, List<MovieModel>>> getUpcomingMovies();

  Future<Either<Failure, MovieDetailModel>> getMovieDetail(int id);

  Future<Either<Failure, List<ReviewModel>>> getMovieReviews(int movieId);

  Future<Either<Failure, bool>> markAsFavorite({
    required int movieId,
    required bool isFavorite,
  });

  Future<Either<Failure, bool>> rateMovie({
    required int movieId,
    required double value,
  });

  Future<Either<Failure, List<MovieModel>>> getRatedMovies({int page = 1});

  Future<Either<Failure, List<MovieModel>>> getFavoriteMovies({int page = 1});
  Future<Either<Failure, AccountStateModel>> getMovieAccountState(int movieId);
  Future<Either<Failure, bool>> deleteRating({required int movieId});
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiClient apiClient;

  MovieRemoteDataSourceImpl(this.apiClient);

  final String accountId = EnvConfig.accountId;
  final String sessionId = EnvConfig.sessionId;

  Future<Either<Failure, List<MovieModel>>> _getMovies(String endpoint) async {
    final result = await apiClient.get(endpoint);

    return result.map((data) {
      final List results = data['results'];
      return results.map((e) => MovieModel.fromJson(e)).toList();
    });
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies({int page = 1}) =>
      _getMovies('${Endpoints.popularMovie}?page=$page');

  @override
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies() =>
      _getMovies(Endpoints.nowPlayingMovie);

  @override
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies() =>
      _getMovies(Endpoints.topRatedMovie);

  @override
  Future<Either<Failure, List<MovieModel>>> getUpcomingMovies() =>
      _getMovies(Endpoints.upcomingMovie);

  @override
  Future<Either<Failure, MovieDetailModel>> getMovieDetail(int id) async {
    final result = await apiClient.get('${Endpoints.movieDetail}/$id');

    return result.map((data) {
      return MovieDetailModel.fromJson(data);
    });
  }

  @override
  Future<Either<Failure, List<ReviewModel>>> getMovieReviews(
    int movieId,
  ) async {
    final result = await apiClient.get(Endpoints.movieReviews(movieId));

    return result.map((data) {
      final List results = data['results'];
      return results.map((e) => ReviewModel.fromJson(e)).toList();
    });
  }

  @override
  Future<Either<Failure, bool>> markAsFavorite({
    required int movieId,
    required bool isFavorite,
  }) async {
    final result = await apiClient.post(
      Endpoints.favorite(accountId),
      queryParameters: {'session_id': sessionId},
      data: {
        "media_type": "movie",
        "media_id": movieId,
        "favorite": isFavorite,
      },
    );

    return result.map((data) => true);
  }

  @override
  Future<Either<Failure, bool>> rateMovie({
    required int movieId,
    required double value,
  }) async {
    const String sessionId = EnvConfig.sessionId;
    final result = await apiClient.post(
      Endpoints.rating(movieId),
      queryParameters: {'session_id': sessionId},
      data: {"value": value},
    );
    return result.map((data) => true);
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getRatedMovies({
    int page = 1,
  }) async {
    final result = await apiClient.get(
      Endpoints.ratedMovies(accountId),
      queryParameters: {
        'session_id': sessionId,
        'sort_by': 'created_at.desc',
        'page': page,
      },
    );

    return result.map((data) {
      final List results = data['results'];
      return results.map((e) => MovieModel.fromJson(e)).toList();
    });
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getFavoriteMovies({
    int page = 1,
  }) async {
    final result = await apiClient.get(
      Endpoints.favoriteMovies(accountId),
      queryParameters: {
        'session_id': sessionId,
        'sort_by': 'created_at.desc',
        'page': page,
      },
    );

    return result.map((data) {
      final List results = data['results'];
      return results.map((e) => MovieModel.fromJson(e)).toList();
    });
  }

  @override
  Future<Either<Failure, AccountStateModel>> getMovieAccountState(
    int movieId,
  ) async {
    const String sessionId = EnvConfig.sessionId;
    final result = await apiClient.get(
      Endpoints.movieAccountState(movieId),
      queryParameters: {'session_id': sessionId},
    );

    return result.map((data) => AccountStateModel.fromJson(data));
  }

  @override
  Future<Either<Failure, bool>> deleteRating({required int movieId}) async {
    final result = await apiClient.delete(
      Endpoints.deleteRating(movieId),
      queryParameters: {'session_id': sessionId},
    );
    return result.map((data) => true);
  }
}
