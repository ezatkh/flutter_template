// lib/app_color.dart

import 'package:flutter/material.dart';

class AppColors {
  // Dark Mode Colors with navy theme
  static const Color primaryColor = Color(0xff0e2b50); // Navy primary color
  static const Color backgroundColor = Color(0xff0e2b50); // Dark navy background color
  static const Color textColor = Color(0xffe3e4e8); // Light gray text color

  // Light Mode Colors
  static const Color lightPrimaryColor = Colors.white; // Light primary color
  static const Color lightBackgroundColor = Colors.white; // Light background color
  static const Color lightTextColor = Colors.black; // Text color for light mode

  // Theme Data
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    textTheme: TextTheme(bodyLarge: TextStyle(color: textColor)),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xff1e2d45), // Input field background color
      hintStyle: TextStyle(color: Color(0xffa8b2d1)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimaryColor,
    scaffoldBackgroundColor: lightBackgroundColor,
    textTheme: TextTheme(bodyLarge: TextStyle(color: lightTextColor)),
  );
}
