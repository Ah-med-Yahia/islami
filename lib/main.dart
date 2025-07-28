import 'package:flutter/material.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/utils/app_theme.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      routes: {
        HomeScreen.routeName:(_)=>const HomeScreen(),
      },
    );
  }
}
