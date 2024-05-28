import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  // BY DEFAULT BACKGROUND COLOR
  scaffoldBackgroundColor: const Color(0xfff1f3f4),
  colorScheme: ColorScheme.light(
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade200,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade900,
    surface: const Color(0xfff1f3f4),
    onSurface: Colors.black,
  ),

  // BY DEFAULT DIALOG THEME
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xfff1f3f4),
  ),

  // BY DEFAULT APP BAR THEME
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
);
