import 'package:flutter/material.dart';

import 'colors.dart';

class MyTheme{
  static appBarTheme(){
    return AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.primary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: Colors.grey,
      ),
    );
  }
}