import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/network_providers.dart';
import '../data/datasources/movie_remote_data_source.dart';
import '../data/repositories/movie_repository_impl.dart';
import '../domain/repositories/movie_repository.dart';

final movieRemoteDataSourceProvider = Provider<MovieRemoteDataSource>((ref) {
  final apiClient = ref.watch(tmdbApiClientProvider);
  return MovieRemoteDataSourceImpl(apiClient);
});

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dataSource = ref.watch(movieRemoteDataSourceProvider);
  return MovieRepositoryImpl(dataSource);
});
