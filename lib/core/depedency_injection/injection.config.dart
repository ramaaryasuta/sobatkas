// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sobatkas/core/depedency_injection/injection.dart' as _i334;
import 'package:sobatkas/features/auth/data/auth_repository_impl.dart' as _i534;
import 'package:sobatkas/features/auth/domain/auth_repository.dart' as _i34;
import 'package:sobatkas/features/auth/domain/auth_usecase.dart' as _i151;
import 'package:sobatkas/features/auth/presentation/cubits/auth_cubit.dart'
    as _i368;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i59.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.lazySingleton<_i116.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.lazySingleton<_i34.AuthRepository>(
      () => _i534.AuthRepositoryImpl(
        gh<_i59.FirebaseAuth>(),
        gh<_i116.GoogleSignIn>(),
      ),
    );
    gh.lazySingleton<_i151.AuthUsecase>(
      () => _i151.AuthUsecase(gh<_i34.AuthRepository>()),
    );
    gh.factory<_i368.AuthCubit>(() => _i368.AuthCubit(gh<_i151.AuthUsecase>()));
    return this;
  }
}

class _$RegisterModule extends _i334.RegisterModule {}
