import 'package:flutter/material.dart';

import '../controllers/sign_up_form_controller.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_primary_button.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/social_icon_buttons.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final SignUpFormController _signUpForm;
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _signUpForm = SignUpFormController();
  }

  @override
  void dispose() {
    _signUpForm.dispose();
    super.dispose();
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
              'Sign up',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 28),
            CustomTextFormField(
              label: 'Name',
              controller: _signUpForm.nameController,
              textInputAction: TextInputAction.next,
              onChanged: (_) => setState(() {}),
              validator: (v) {
                final text = (v ?? '').trim();
                if (text.isEmpty) return 'Name is required';
                return null;
              },
              suffixIcon: _signUpForm.nameController.text.trim().isNotEmpty
                  ? const Icon(
                      Icons.check_circle,
                      color: AppColors.greenCheck,
                      size: 22,
                    )
                  : null,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              label: 'Email',
              controller: _signUpForm.emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (v) {
                final text = (v ?? '').trim();
                if (text.isEmpty) return 'Email is required';
                if (!text.contains('@') || !text.contains('.')) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'Password',
              controller: _signUpForm.passwordController,
              obscureText: true,
              textInputAction: TextInputAction.done,
              validator: (v) {
                final text = (v ?? '').trim();
                if (text.isEmpty) return 'Password is required';
                if (text.length < 6) return 'Password must be at least 6 characters';
                return null;
              },
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _loading
                    ? null
                    : () {
                  Navigator.of(context).pushNamed('/login');
                },
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
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
              text: 'SIGN UP',
              isLoading: _loading,
              onPressed: () async {
                final ok = _formKey.currentState?.validate() ?? false;
                if (!ok) return;
                setState(() => _loading = true);
                await Future<void>.delayed(const Duration(seconds: 1));
                if (!mounted) return;
                setState(() => _loading = false);

                // Temporary navigation after sign up
                Navigator.of(context).pushNamed('/login');
              },
            ),
            const SizedBox(height: 32),
            Text(
              'Or sign up with social account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 16),
            SocialIconButtons(
              onGoogle: () {},
              onFacebook: () {},
            ),
            const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
