import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height,
    this.isLoading,
    this.color,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final double? height;
  final IconData icon;
  final String text;
  final bool? isLoading;
  final Color? color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return (isLoading ?? false)
        ? SpinKitCircle(color: Colors.red)
        : InkWell(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              height: height ?? 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: color ?? AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
  }
}
