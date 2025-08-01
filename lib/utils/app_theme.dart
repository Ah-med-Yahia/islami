import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFE2BE7F);
  static const Color black = Color(0xFF202020);
  static const Color white = Color(0xFFFFFFFF);

  static ThemeData appTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: black,
    appBarTheme: const AppBarTheme(
      backgroundColor: black,
      foregroundColor: primaryColor,
      centerTitle: true,
      titleTextStyle:  TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: primaryColor
      )
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: white
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: white
      ),
      titleMedium:  TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: white
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: white
      )
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppTheme.white,
      backgroundColor: primaryColor,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: white.withOpacity(.6)
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color:primaryColor, 
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color:primaryColor, 
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      filled: true,
      fillColor: black.withOpacity(.7),
      
    )
  );
}
