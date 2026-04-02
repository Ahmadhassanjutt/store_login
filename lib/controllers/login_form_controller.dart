import 'package:flutter/material.dart';

/// Text fields for the login screen only. Call [dispose] when the screen closes.
class LoginFormController {
  LoginFormController()
      : emailController =
            TextEditingController(text: '@gmail.com'),
        passwordController = TextEditingController();

  final TextEditingController emailController;
  final TextEditingController passwordController;

  bool emailLooksValid() {
    final value = emailController.text;
    return value.contains('@') && value.contains('.');
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
