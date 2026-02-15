import 'package:flutter/material.dart';
import 'package:notesphere/core/colors_themes/colors.dart';
import 'package:notesphere/core/colors_themes/shadows.dart';
import 'package:notesphere/core/extensions/context_extension.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String? label;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool isExtended;

  const CustomFloatingActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.label,
    this.backgroundColor,
    this.foregroundColor,
    this.isExtended = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.theme.brightness == Brightness.dark;

    if (isExtended && label != null) {
      return FloatingActionButton.extended(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(
          label!,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        backgroundColor: backgroundColor ?? context.colorScheme.primary,
        foregroundColor: foregroundColor ?? AppColors.white,
      );
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: AppColors.gradient,
        shape: BoxShape.circle,
        boxShadow: AppShadows.card(isDark),
      ),
      child: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: onPressed,
        backgroundColor: backgroundColor ?? AppColors.transparent,
        foregroundColor: foregroundColor ?? AppColors.white,
        child: Icon(icon),
      ),
    );
  }
}
