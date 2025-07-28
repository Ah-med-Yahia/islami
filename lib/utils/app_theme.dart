import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFE2BE7F);
  static const Color black = Color(0xFF202020);
  static const Color white = Color(0xFFFFFFFF);

  static ThemeData appTheme = ThemeData(
    primaryColor: primaryColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    )
  );
}
