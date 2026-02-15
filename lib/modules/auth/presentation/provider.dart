import 'package:accurate/constants/extensions.dart';
import 'package:accurate/constants/toast_manager.dart';
import 'package:accurate/modules/auth/presentation/state.dart';
import 'package:accurate/modules/auth/service/auth_service.dart';
import 'package:flutter/material.dart';

import '../../shipment/presentation/views/home_view.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService authService;

  AuthProvider(this.authService);

  AuthState state = AuthState();

  Future login({
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    if (!state.formKey.currentState!.validate()) {
      //  ToastManager.showError("Please fill all fields");
      return;
    }
    state.isLoading = true;
    notifyListeners();
    final result = await authService.login(
      username: username,
      password: password,
    );
    result.fold((error) => ToastManager.showError(error.message), (token) {
      sharedPrefs.setString("token", token);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => HomeView()));
      ToastManager.showSuccess("Logged in successfully");
    });
    state.isLoading = false;
    notifyListeners();
  }

  String? passValidation(String? value) {
    if (value == null) {
      return 'الرجاء إدخال كلمة المرور';
    }
    if (value.length < 6) {
      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    }
    return null;
  }
}
