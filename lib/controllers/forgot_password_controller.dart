import 'package:flutter/material.dart';

class ForgotPasswordController {
  ForgotPasswordController()
      : emailController = TextEditingController(text: 'email2');

  final TextEditingController emailController;

  String? validateEmail() {
    final text = emailController.text.trim();
    final isValid = text.contains('@') && text.contains('.') && text.length > 5;

    if (isValid) {
      return null;
    }

    return 'Not a valid email address. Should be your@email.com';
  }

  void clearEmail() {
    emailController.clear();
  }

  void dispose() {
    emailController.dispose();
  }
}
