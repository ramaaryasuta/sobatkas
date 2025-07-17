import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sobatkas/core/extensions/context_extensions.dart';
import 'package:sobatkas/core/routing/app_route.gr.dart';
import 'package:sobatkas/core/styles/colors.dart';
import 'package:sobatkas/gen/assets.gen.dart';
import 'package:sobatkas/shared/widgets/image/asset_image.dart';
import 'package:sobatkas/shared/widgets/button/button_elevated.dart';
import 'package:sobatkas/shared/widgets/button/button_outline.dart';
import 'package:sobatkas/shared/widgets/text_field.dart';

import '../../../../shared/utils/ui_helper.dart';
import '../cubits/auth_cubit.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: context.screenHeight * .08),

              MyAssetImage(Assets.images.logo.path, height: 100),

              Text(
                'Masuk SobatKas',
                style: context
                    .getHeadlineSmallTextStyle(MyColors.primaryColor)!
                    .copyWith(fontWeight: FontWeight.bold),
              ),

              Container(
                constraints: BoxConstraints(
                  maxWidth: context.screenWidth * 0.8,
                ),
                child: Text(
                  'Masukan nama dan password untuk masuk ke akun Anda',
                  textAlign: TextAlign.center,
                  style: context.bodyMediumTextStyle,
                ),
              ),

              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Column(
                    spacing: 16,
                    children: [
                      MTextField(
                        controller: _emailController,
                        title: 'Email',
                        titleStyle: context.bodyMediumTextStyle!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MTextField(
                        controller: _passwordController,
                        title: 'Password',
                        titleStyle: context.bodyMediumTextStyle!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(),
                      MFilledElevatedButton(
                        textButton: 'Masuk',
                        onPressed: () {},
                      ),
                      MOutlinedButton(
                        icon: Assets.icons.google,
                        textButton: 'Login Menggunakan Google',
                        textStyle: context.bodyMediumTextStyle!.copyWith(
                          color: MyColors.primaryColor,
                        ),
                        onPressed: () async {
                          final authCubit = context.read<AuthCubit>();
                          await authCubit.login();
                        },
                      ),
                    ],
                  ),
                ),
              ),

              RichText(
                text: TextSpan(
                  text: 'Belum memiliki akun? ',
                  style: context.bodyMediumTextStyle,
                  children: [
                    TextSpan(
                      text: 'Daftar Akun',
                      style: context.bodyMediumTextStyle!.copyWith(
                        color: MyColors.primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.router.push(const RegisterRoute());
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
