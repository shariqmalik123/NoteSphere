import 'package:flutter/material.dart';

class AppColors {
  // Brand
  static const Color primary = Color(0xFF0D00FF);
  static const Color secondary = Color(0xFF22C55E);

  // Light
  static const Color lightBackground = Color(0xFFF9FAFB);
  static const Color lightSurface = Colors.white;
  static const Color lightText = Color(0xFF111827);
  static const Color lightSubText = Color(0xFF6B7280);

  // Dark
  static const Color darkBackground = Color(0xFF080D17);
  static const Color darkSurface = Color(0xFF080D17);
  static const Color darkText = Color(0xFFE5E7EB);
  static const Color darkSubText = Color(0xFF9CA3AF);

  //border Colors
  static const Color lightBorder = Color(0xFFE5E7EB);
  static const Color darkBorder = Color(0xFF1F2933);

  // Common
  static const Color error = Color(0xFFEF4444);
  static const Color border = Color(0xFFE5E7EB);
  static const Color transparent = Colors.transparent;
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  //gradient
  static final Gradient gradient = const LinearGradient(
    colors: [Color(0xFF0D00FF), Color(0xFFC522B5)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
