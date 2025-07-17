import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sobatkas/core/extensions/context_extensions.dart';
import 'package:sobatkas/shared/widgets/button/button_elevated.dart';
import 'package:sobatkas/shared/widgets/text_field.dart';

import '../../../../core/styles/colors.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _registerFormKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  // TODO: sample value, should handle on statemanagement not ui
  String _gender = 'Laki-laki';
  String _birthDate = '2000-01-01';

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Daftar Akun',
          style: context.getTitleLargeTextStyle(MyColors.primaryColor),
        ),
      ),
      body: ListView(
        children: [
          Form(
            key: _registerFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                spacing: 16,
                children: [
                  MTextField(
                    controller: _emailController,
                    title: 'Email',
                    titleStyle: context.bodyMediumTextStyle!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: 'example@gmail.com',
                  ),

                  MTextField(
                    controller: _phoneController,
                    title: 'Nomor Handphone',
                    titleStyle: context.bodyMediumTextStyle!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: '+628.....',
                  ),

                  _buildGenderSelect(context),

                  _buildBirthDateSelect(context),

                  MTextField(
                    controller: _passwordController,
                    title: 'Password',
                    titleStyle: context.bodyMediumTextStyle!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    subtitle: 'Harus memuat angka dan huruf',
                  ),

                  const SizedBox(),
                  MFilledElevatedButton(
                    onPressed: () {},
                    textButton: 'Daftar Akun',
                  ),
                ],
              ),
            ),
          ),

          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Sudah punya akun? ',
                    style: context.bodyMediumTextStyle,
                  ),
                  TextSpan(
                    text: 'Masuk',
                    style: context.bodyMediumTextStyle!.copyWith(
                      color: MyColors.primaryColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.router.pop();
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildBirthDateSelect(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tanggal Lahir',
          style: context.bodyMediumTextStyle!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(_birthDate),
          ),
        ),
      ],
    );
  }

  Column _buildGenderSelect(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jenis Kelamin',
          style: context.bodyMediumTextStyle!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<String>(
            value: _gender,
            isExpanded: true,
            underline: null,
            items: const [
              DropdownMenuItem(value: 'Laki-laki', child: Text('Laki-laki')),
              DropdownMenuItem(value: 'Perempuan', child: Text('Perempuan')),
            ],
            onChanged: (v) {
              setState(() {
                _gender = v.toString();
              });
            },
            borderRadius: BorderRadius.circular(10),
            elevation: 2,
            dropdownColor: Colors.white,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
            style: context.bodyMediumTextStyle!.copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
