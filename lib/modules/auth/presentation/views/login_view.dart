import 'package:accurate/modules/auth/presentation/widgets/login_header_widget.dart';
import 'package:accurate/modules/auth/presentation/widgets/login_body_widget.dart';
import 'package:accurate/modules/auth/service/auth_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(AuthServiceImpl()),
      child: Builder(
        builder: (context) {
          final provider = Provider.of<AuthProvider>(context, listen: true);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(title: const Text("تسجيل الدخول")),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  spacing: 40,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    LoginHeaderWidget(),
                    LoginBodyWidget(provider: provider),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
