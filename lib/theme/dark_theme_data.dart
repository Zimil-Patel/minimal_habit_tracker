import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  // BY DEFAULT BACKGROUND COLOR
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.light(
    primary: Colors.grey.shade600,
    secondary: Colors.grey.shade700,
    tertiary: const Color(0xff272727),
    inversePrimary: const Color.fromARGB(255, 247, 95, 95),
    surface: const Color(0xff1e1e1e),
  ),

  // BY DEFAULT APP BAR THEME
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff1e1e1e),
    foregroundColor: Colors.white,
  ),
);
