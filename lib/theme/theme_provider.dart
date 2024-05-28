import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dark_theme_data.dart';
import 'light_theme_data.dart';

class ThemeProvider extends ChangeNotifier {
  // INITIAL THEME MODE: DARK
  ThemeData _themeData = darkTheme;
  bool _isDark = true;

  // GET CURRENT THEME MODE: _themeMode
  ThemeData get themeData => _themeData;
  bool get isDarkMode => _isDark;

  // CONSTRUCTOR
  ThemeProvider() {
    checkForThemePreference();
  }

  // CHECK FOR THEME PREFERENCE IN DEVICE SHARED PREFERENCE
  Future<void> checkForThemePreference() async {
    SharedPreferences themePreference = await SharedPreferences.getInstance();

    if (themePreference.containsKey('isDark')) {
      _isDark = themePreference.getBool('isDark')!;
    } else {
      themePreference.setBool('isDark', _isDark);
    }

    if (_isDark) {
      _themeData = darkTheme;
    } else {
      _themeData = lightTheme;
    }

    notifyListeners();
  }

  // SET THEME
  set themeMode(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // TOGGLE THEME MODE
  Future<void> toggleThemeData() async {
    SharedPreferences themePreference = await SharedPreferences.getInstance();
    if (_isDark) {
      _themeData = lightTheme;
      _isDark = false;
      themePreference.setBool('isDark', _isDark);
    } else {
      _themeData = darkTheme;
      _isDark = true;
      themePreference.setBool('isDark', _isDark);
    }
    notifyListeners();
  }
}
