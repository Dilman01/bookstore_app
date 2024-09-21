import 'package:bookstore_app/repositories/auth_repository/auth_repositroy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepositroy authRepository(AuthRepositoryRef ref) {
  return AuthRepositroy();
}
