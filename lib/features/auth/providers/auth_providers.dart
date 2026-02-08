import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/providers/network_providers.dart';
import '../data/datasources/local/auth_local_data_source.dart';
import '../data/datasources/remote/auth_remote_data_source.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});
final sharedPreferencesAsyncProvider = Provider<SharedPreferencesAsync>((ref) {
  return SharedPreferencesAsync();
});

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  return AuthLocalDataSource();
});

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(ref.watch(basicApiClientProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final local = ref.watch(authLocalDataSourceProvider);
  final remote = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remote, local);
});
