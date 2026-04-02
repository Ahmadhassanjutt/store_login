import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class SocialIconButtons extends StatelessWidget {
  const SocialIconButtons({
    super.key,
    this.onGoogle,
    this.onFacebook,
  });

  final VoidCallback? onGoogle;
  final VoidCallback? onFacebook;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _SocialButton(onTap: onGoogle, icon: _googleIcon())),
        const SizedBox(width: 16),
        Expanded(
          child: _SocialButton(
            onTap: onFacebook,
            icon: const Icon(
              Icons.facebook,
              size: 28,
              color: AppColors.facebookBlue,
            ),
          ),
        ),
      ],
    );
  }

  Widget _googleIcon() {
    return Text(
      'G',
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: AppColors.googleBlue,
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.icon,
    this.onTap,
  });

  final Widget icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.fieldWhite,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: icon,
        ),
      ),
    );
  }
}
