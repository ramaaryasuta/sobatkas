import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sobatkas/features/auth/presentation/cubits/auth_cubit.dart';

import 'core/depedency_injection/injection.dart';
import 'core/routing/app_route.dart';
import 'core/styles/app_theme.dart';
import 'features/auth/domain/auth_usecase.dart';
import 'firebase_options.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // init configuration
      await initializeDateFormatting('id_ID', null); // locale
      await configureDepedency(); // dependency injection config
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ); // firebase config

      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<AuthCubit>(
              create: (context) => AuthCubit(getIt<AuthUsecase>()),
            ),
          ],
          child: MyApp(),
        ),
      );
    },
    (e, s) {
      log('runZonedGuarded error', error: e, stackTrace: s);
    },
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SobatKas',
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      theme: mainTheme,
    );
  }
}
