import 'package:flutter/material.dart';
import 'theme_data.dart';

abstract class AppTheme {
  static ThemeData get light => AppThemeData.lightTheme;
  static ThemeData get dark => AppThemeData.darkTheme;
}