import 'package:flutter/material.dart';

class CustomNavItem extends StatelessWidget {
  final IconData icon;
  final bool active;
  final VoidCallback? onTap;

  const CustomNavItem({
    super.key,
    required this.icon,
    required this.active,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: active ? Colors.red : Colors.grey,
      ),
    );
  }
}
