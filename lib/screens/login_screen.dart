import 'package:flutter/material.dart';

import '../controllers/login_form_controller.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_primary_button.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/social_icon_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginFormController _loginForm;
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loginForm = LoginFormController();
  }

  @override
  void dispose() {
    _loginForm.dispose();
    super.dispose();
  }

  void _goToSignUp() {
    Navigator.of(context).pushNamed('/signup');
  }

  Future<void> _onLogin() async {
    final ok = _formKey.currentState?.validate() ?? false;
    if (!ok) return;

    setState(() => _loading = true);
    await Future<void>.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() => _loading = false);

    // Temporary navigation after login
    Navigator.of(context).pushNamed('/visual-search');
  }

  String? _validateEmail(String? value) {
    final v = (value ?? '').trim();
    if (v.isEmpty) return 'Email is required';
    if (!v.contains('@') || !v.contains('.')) return 'Enter a valid email';
    return null;
  }

  String? _validatePassword(String? value) {
    final v = (value ?? '').trim();
    if (v.isEmpty) return 'Password is required';
    if (v.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              IconButton(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.of(context).maybePop(),
                icon: const Icon(
                  Icons.chevron_left,
                  size: 28,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 28),
              CustomTextFormField(
                label: 'Email',
                controller: _loginForm.emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onChanged: (_) => setState(() {}),
                validator: _validateEmail,
                suffixIcon: _loginForm.emailLooksValid()
                    ? const Icon(
                        Icons.check_circle,
                        color: AppColors.greenCheck,
                        size: 22,
                      )
                    : null,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Password',
                controller: _loginForm.passwordController,
                obscureText: true,
                textInputAction: TextInputAction.done,
                validator: _validatePassword,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _loading
                      ? null
                      : () {
                          Navigator.of(context).pushNamed('/forgot');
                        },
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Forgot your password? ',
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: '→',
                          style: TextStyle(
                            color: AppColors.primaryRed,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomPrimaryButton(
                text: 'LOGIN',
                isLoading: _loading,
                onPressed: _onLogin,
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _loading ? null : _goToSignUp,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: '→',
                          style: TextStyle(
                            color: AppColors.primaryRed,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Or login with social account',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: AppColors.textMuted),
              ),
              const SizedBox(height: 16),
              SocialIconButtons(onGoogle: () {}, onFacebook: () {}),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
