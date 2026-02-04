import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../models/movie_model.dart';
import '../models/movie_response.dart';

class MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSource(this.dio);

  Future<List<MovieModel>> fetchPopular() async {
    final response = await dio.get('/movie/popular');
    final movieResponse = MovieResponse.fromJson(response.data);

    return movieResponse.results;
  }
}

final movieDataSourceProvider = Provider(
  (ref) => MovieRemoteDataSource(ref.watch(tmdbDioProvider)),
);
