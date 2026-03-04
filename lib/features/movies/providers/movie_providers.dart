import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:movie_demo_app/core/providers/network_providers.dart';
import 'package:movie_demo_app/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:movie_demo_app/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:movie_demo_app/features/movies/domain/repositories/movie_repository.dart';

final movieRemoteDataSourceProvider = Provider<MovieRemoteDataSource>((ref) {
  final apiClient = ref.watch(tmdbApiClientProvider);
  return MovieRemoteDataSourceImpl(apiClient);
});

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dataSource = ref.watch(movieRemoteDataSourceProvider);
  return MovieRepositoryImpl(dataSource);
});
