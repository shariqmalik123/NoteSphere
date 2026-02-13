import 'package:flutter/material.dart';
import 'package:notesphere/core/colors_themes/colors.dart';
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
    if (isExtended && label != null) {
      return FloatingActionButton.extended(
        shape: CircleBorder(),
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

    return FloatingActionButton(
      shape: CircleBorder(),
      onPressed: onPressed,
      backgroundColor: backgroundColor ?? context.colorScheme.primary,
      foregroundColor: foregroundColor ?? AppColors.white,
      child: Icon(icon),
    );
  }
}
