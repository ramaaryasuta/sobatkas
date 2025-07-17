import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sobatkas/gen/assets.gen.dart';
import 'package:sobatkas/shared/widgets/asset_image.dart';

import '../../core/routing/app_route.gr.dart';

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
    _checkAuth();
  }

  void _checkAuth() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      context.router.replace(const HomeRoute());
    } else {
      context.router.replace(const LoginRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: MyAssetImage(Assets.images.logo.path, height: 100)),
    );
  }
}
