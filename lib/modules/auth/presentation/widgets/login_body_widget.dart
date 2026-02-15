import 'package:accurate/constants/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../provider.dart';

class LoginBodyWidget extends StatefulWidget {
  const LoginBodyWidget({super.key, required this.provider});

  final AuthProvider provider;

  @override
  State<LoginBodyWidget> createState() => _LoginBodyWidgetState();
}

class _LoginBodyWidgetState extends State<LoginBodyWidget> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.provider.state.formKey,

      child: Column(
        children: [
          CustomTextFormField(
            controller: widget.provider.state.usernameController,
            labelText: 'اسم المستخدم',
            hintText: 'أدخل اسم المستخدم',
            prefixIcon: Icons.person_outline,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال اسم المستخدم';
              }
              return null;
            },
          ),

          20.sbh,

          CustomTextFormField(
            controller: widget.provider.state.passwordController,
            labelText: 'كلمة المرور',
            hintText: 'أدخل كلمة المرور',
            prefixIcon: Icons.lock_outline,
            obscureText: !_isPasswordVisible,
            suffixIcon: _isPasswordVisible
                ? Icons.visibility_off
                : Icons.visibility,
            onSuffixIconPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
            textInputAction: TextInputAction.done,
            validator: (value) {
           return   widget.provider.passValidation(value);

            },
          ),
          30.sbh,

          CustomButton(
            isLoading: widget.provider.state.isLoading,
            icon: Icons.login,
            text: "تسجيل الدخول",
            onTap: () => widget.provider.login(
              username: widget.provider.state.usernameController.text,
              password: widget.provider.state.passwordController.text,
              context: context,
            ),
          ),
        ],
      ),
    );
  }
}
