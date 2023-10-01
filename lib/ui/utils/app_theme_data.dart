import 'package:flutter/material.dart';
import 'package:todo_app/ui/utils/app_theme_colors.dart';

abstract class AppThemeData {
  static ThemeData lightTheme = ThemeData(

    textTheme: TextTheme(
      labelMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: AppThemeColors.labelMediumTextColorLight
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppThemeColors.primaryTextColorLight
      ),
      titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: AppThemeColors.accentLight
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppThemeColors.primary
      ),
      bodyLarge: TextStyle(
        color: AppThemeColors.primaryTextColorLight,
        fontSize: 12,
        fontWeight: FontWeight.normal
      ),
      bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppThemeColors.primaryTextColorLight
      ),
    ),

    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: AppThemeColors.primary,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppThemeColors.accentLight
      )
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      iconSize: 30,
      shape: CircleBorder(
          side: BorderSide(
              color: AppThemeColors.accentLight,
              width: 4
          )
      ),
    ),

    bottomAppBarTheme: BottomAppBarTheme(
      shape: CircularNotchedRectangle(),

      color: AppThemeColors.accentLight,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,

      selectedIconTheme: IconThemeData(
        size: 34,
        color: AppThemeColors.primary
      ),
      unselectedIconTheme: IconThemeData(
          size: 34,
          color: AppThemeColors.unselectedIconColor
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppThemeColors.primary
      ),
    ),

    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0))
      ),
      clipBehavior: Clip.hardEdge,
    ),
  );

  static ThemeData darkTheme = ThemeData(

    textTheme: TextTheme(
      labelMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: AppThemeColors.labelMediumTextColorDark
      ),
      titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppThemeColors.accentLight
      ),
      titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: AppThemeColors.accentLight
      ),
      titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppThemeColors.primary
      ),
      bodyLarge: TextStyle(
          color: AppThemeColors.accentLight,
          fontSize: 12,
          fontWeight: FontWeight.normal
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppThemeColors.labelMediumTextColorDark
      ),
    ),

    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: AppThemeColors.primary,
      titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppThemeColors.accentDark
      )
    ),

    iconTheme: IconThemeData(
        size: 34,
        color: AppThemeColors.primary
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      iconSize: 30,
      shape: CircleBorder(
          side: BorderSide(
              color: AppThemeColors.accentDark,
              width: 4
          )
      ),
    ),

    bottomAppBarTheme: BottomAppBarTheme(
      shape: CircularNotchedRectangle(),

      color: AppThemeColors.accentDark,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,

      selectedIconTheme: IconThemeData(
          size: 34,
          color: AppThemeColors.primary
      ),
      unselectedIconTheme: IconThemeData(
          size: 34,
          color: AppThemeColors.unselectedIconColor
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppThemeColors.primary
      ),
    ),

    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0))
      ),
      clipBehavior: Clip.hardEdge,
    ),
  );
}