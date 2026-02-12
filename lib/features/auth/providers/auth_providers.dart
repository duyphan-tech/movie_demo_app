import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/core/providers/network_providers.dart';
import 'package:movie_demo_app/core/providers/storage_providers.dart';
import 'package:movie_demo_app/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:movie_demo_app/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:movie_demo_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:movie_demo_app/features/auth/domain/repositories/auth_repository.dart';

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  return AuthLocalDataSource(ref.watch(localStorageProvider));
});

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(ref.watch(basicApiClientProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final local = ref.watch(authLocalDataSourceProvider);
  final remote = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remote, local);
});
