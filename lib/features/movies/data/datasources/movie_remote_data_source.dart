import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/endpoints.dart';
import '../../../../core/providers/network_providers.dart';
import '../models/movie_detail_model.dart';
import '../models/movie_model.dart';
import '../models/response/movie_response.dart';

abstract class MovieRemoteDataSource {
  Future<Either<Failure, List<MovieModel>>> getPopularMovies();

  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies();

  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies();

  Future<Either<Failure, List<MovieModel>>> getUpcomingMovies();

  Future<Either<Failure, MovieDetailModel>> getMovieDetail(int id);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiClient apiClient;

  MovieRemoteDataSourceImpl(this.apiClient);

  Future<Either<Failure, List<MovieModel>>> _getMovies(String endpoint) async {
    final result = await apiClient.get(endpoint);

    return result.map((data) {
      final List results = data['results'];
      return results.map((e) => MovieModel.fromJson(e)).toList();
    });
  }

  // Future<MovieDetailModel> fetchMovieDetail(int movieId) async {
  //   final response = await dio.get('/movie/$movieId');
  //   return MovieDetailModel.fromJson(response.data);
  // }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies() =>
      _getMovies(Endpoints.popularMovie);

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
}
