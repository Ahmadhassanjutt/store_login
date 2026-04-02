import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// White box + shadow around a [TextFormField]. Pass [label] or only [hintText].
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.label,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.suffixIcon,
    this.focusNode,
    this.autofocus = false,
    this.validator,
  });

  final String? label;
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.fieldWhite,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(16, label != null ? 8 : 14, 12, 12),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onChanged: onChanged,
        focusNode: focusNode,
        autofocus: autofocus,
        validator: validator,
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.textDark,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 12,
            color: AppColors.labelGray,
          ),
          floatingLabelBehavior: label != null
              ? FloatingLabelBehavior.always
              : FloatingLabelBehavior.never,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: AppColors.labelGray,
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
