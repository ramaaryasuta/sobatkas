import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sobatkas/features/auth/domain/auth_usecase.dart';
import 'package:sobatkas/features/auth/presentation/cubits/auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthUsecase _authUsecase;

  AuthCubit(this._authUsecase) : super(AuthInitial());

  Future<void> login() async {
    try {
      final user = await _authUsecase.login(loginMethod: LoginMethod.google);
      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        emit(const AuthError('Login Gagal'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      await _authUsecase.logout();
      emit(UnAuthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void checkCurrentUser(User? user) {
    if (user != null) {
      emit(AuthSuccess(user));
    } else {
      emit(UnAuthenticated());
    }
  }
}
