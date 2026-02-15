import 'package:flutter/material.dart';

class AppShadows {
  static List<BoxShadow> card(bool isDark) => [
    // Main depth shadow (card lift)
    BoxShadow(
      color: isDark
          ? Colors.black.withOpacity(0.75) // deeper for dark bg
          : Colors.black.withOpacity(0.10), // softer for light bg
      blurRadius: 18,
      spreadRadius: 0,
      offset: const Offset(0, 10),
    ),

    // Soft highlight edge (3D bevel illusion)
    BoxShadow(
      color: isDark
          ? Colors.white.withOpacity(0.04) // subtle glow on dark bg
          : Colors.white.withOpacity(0.7), // soft light edge on light bg
      blurRadius: 8,
      spreadRadius: -3,
      offset: const Offset(-3, -3),
    ),
  ];
}
