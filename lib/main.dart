import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/home/home_screen.dart';
import 'package:todo_app/ui/screens/splash/splash_screen.dart';
import 'package:todo_app/ui/utils/app_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        SplashScreen.routeName : (_) => SplashScreen(),
        HomeScreen.routeName : (_) => HomeScreen()
      },

      initialRoute: SplashScreen.routeName,

      themeMode: ThemeMode.light,
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
    );
  }
}
