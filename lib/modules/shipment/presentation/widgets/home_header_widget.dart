import 'package:accurate/constants/extensions.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../generated/assets.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: BounceInDown(
            duration: const Duration(seconds: 1),
            curve: Curves.easeOutBack,

            child: Container(
              height: 120,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Image.asset(
                Assets.imagesLogo,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.local_shipping,
                      size: 60,
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        20.sbh,

        const Center(
          child: Text(
            'مرحباً بك في',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),

        FadeInUp(
          duration: const Duration(milliseconds: 800),
          child: const Center(
            child: Text(
              'تطبيق تتبع الشحنات',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
        ),

        30.sbh,

        FadeInLeft(
          duration: const Duration(seconds: 1),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary.withOpacity(0.1),
                  AppColors.primary.withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.track_changes,
                      color: AppColors.primary,
                      size: 30,
                    ),

                    Text(
                      'تتبع الشحنات الذكي',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                16.sbh,
                const Text(
                  'تطبيق متكامل لإدارة وتتبع الشحنات بكل سهولة. '
                  'تابع حركة شحناتك في الوقت الفعلي، وتعرف على حالة كل شحنة '
                  'وموقعها الحالي بدقة عالية.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
