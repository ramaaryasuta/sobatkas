import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sobatkas/gen/assets.gen.dart';
import 'package:sobatkas/shared/widgets/image/asset_image.dart';
import '../../core/routing/app_route.gr.dart';
import '../auth/presentation/cubits/auth_cubit.dart';
import '../auth/presentation/cubits/auth_state.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<AuthCubit>().checkCurrentUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.router.replace(const HomeRoute());
          } else if (state is UnAuthenticated) {
            context.router.replace(const LoginRoute());
          }
        },
        child: Center(
          child: MyAssetImage(Assets.images.logo.path, height: 100),
        ),
      ),
    );
  }
}
