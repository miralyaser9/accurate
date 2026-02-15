import 'package:accurate/constants/extensions.dart';
import 'package:accurate/constants/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'modules/auth/presentation/views/login_view.dart';
import 'modules/shipment/presentation/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: MaterialApp(
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('ar'),
        debugShowCheckedModeBanner: false,
        title: 'Accurate',
        theme: ThemeData(
          appBarTheme: MyTheme.appBarTheme(),
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Color(Colors.red.value)),
        ),
        home: sharedPrefs.getString("token") == null
            ? const LoginView()
            : HomeView(),
      ),
    );
  }
}
