import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:sobatkas/features/auth/domain/auth_repository.dart';

enum LoginMethod { email, google }

@lazySingleton
class AuthUsecase {
  final AuthRepository _authRepository;

  AuthUsecase(this._authRepository);

  Future<User?> login({required LoginMethod loginMethod}) async {
    switch (loginMethod) {
      case LoginMethod.google:
        return _authRepository.loginWithGoogle();
      default:
        return null;
    }
  }

  Future<void> logout() async => _authRepository.logout();
}
