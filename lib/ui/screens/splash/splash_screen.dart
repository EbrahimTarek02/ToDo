import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/home/home_screen.dart';
import 'package:todo_app/ui/utils/app_assets.dart';

class SplashScreen extends StatelessWidget {

  static final String routeName = 'splash';

  @override
  Widget build(BuildContext context) {

    Future.delayed(
      Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, HomeScreen.routeName)
    );

    return Scaffold(
      body: Center(child: Image.asset(AppAssets.splash))
    );
  }
}
