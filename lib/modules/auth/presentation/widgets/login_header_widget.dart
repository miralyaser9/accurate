import 'package:accurate/constants/extensions.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../generated/assets.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeIn(
          duration: const Duration(seconds: 1),

          child: Image.asset(
            Assets.imagesLogo,
            fit: BoxFit.contain,
            height: 120
          ),
        ),

        20.sbh,

        Text(
          'مرحباً بعودتك',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          textAlign: TextAlign.center,
        ),

        8.sbh,

        const Text(
          'سجل دخولك للمتابعة',
          style: TextStyle(fontSize: 14, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
