import 'package:flutter/material.dart';

/// Text fields for the sign-up screen only. Call [dispose] when the screen closes.
class SignUpFormController {
  SignUpFormController()
      : nameController = TextEditingController(text: 'Mr. Ahmed'),
        emailController = TextEditingController(text: '@gmail.com'),
        passwordController = TextEditingController();

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
