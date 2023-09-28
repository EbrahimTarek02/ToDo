import 'package:flutter/material.dart';
import 'package:todo_app/ui/utils/app_theme_colors.dart';

abstract class AppThemeData {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppThemeColors.scaffoldBackgroundLight,
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppThemeColors.scaffoldBackgroundDark,
  );
}