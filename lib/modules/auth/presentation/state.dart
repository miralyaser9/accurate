import 'package:flutter/cupertino.dart';

class AuthState{
   bool isLoading= false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
}