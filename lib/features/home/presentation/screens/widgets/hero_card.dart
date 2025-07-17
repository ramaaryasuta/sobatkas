import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sobatkas/core/extensions/context_extensions.dart';
import 'package:sobatkas/shared/utils/util.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../shared/widgets/image/network_image.dart';
import '../../../../auth/presentation/cubits/auth_cubit.dart' show AuthCubit;
import '../../../../auth/presentation/cubits/auth_state.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
      decoration: const BoxDecoration(
        color: MyColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Column(
        spacing: 20,
        children: [
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return Row(
                  spacing: 10,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: state.user.photoURL != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: MNetworkImage(state.user.photoURL!),
                            )
                          : const Icon(Icons.person_2_outlined),
                    ),
                    Column(
                      spacing: 2,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          greetingTime(),
                          style: context.bodySmallTextStyle!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          state.user.displayName ?? '',
                          style: context.titleLargeTextStyle!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return const Icon(Icons.person_2_outlined);
              }
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Pengeluaran',
                    style: context
                        .getBodyMediumTextStyle(Colors.white)!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Rp ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: '1.000.000',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Container(
                width: 80,
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  getThisMonth(),
                  style: context.bodyMediumTextStyle!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: MyColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
