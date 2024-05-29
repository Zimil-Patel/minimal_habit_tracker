import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = true;

  // CONSTRUCTOR
  ThemeProvider() {
    checkForThemePreference();
  }

  // CHECK FOR THEME PREFERENCE IN DEVICE SHARED PREFERENCE
  Future<void> checkForThemePreference() async {
    SharedPreferences themePreference = await SharedPreferences.getInstance();

    if (themePreference.containsKey('isDark')) {
      isDark = themePreference.getBool('isDark')!;
    } else {
      await themePreference.setBool('isDark', isDark);
    }
    notifyListeners();
  }

  // TOGGLE THEME MODE
  Future<void> toggleThemeData() async {
    SharedPreferences themePreference = await SharedPreferences.getInstance();
    isDark = !isDark;
    await themePreference.setBool('isDark', isDark);
    log('------------------- Theme update: $isDark -------------------');
    log('------------------- Theme update: notifyListeners -------------------');
    notifyListeners();
  }
}
