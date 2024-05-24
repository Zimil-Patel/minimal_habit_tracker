import 'package:flutter/material.dart';
import 'package:minimal_habi_tracker/theme/dark_theme_data.dart';
import 'package:minimal_habi_tracker/theme/light_theme_data.dart';

class ThemeProvider extends ChangeNotifier {
  // INITIAL THEME MODE: DARK
  ThemeData _themeData = darkTheme;

  UniqueKey _animationKey = UniqueKey();

  // GET CURRENT THEME MODE: _themeMode
  ThemeData get themeData => _themeData;

  UniqueKey get animationKey => _animationKey;

  // SET THEME
  set themeMode(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // CHECK IF IS DARK MODE: TRUE / FALSE
  bool get isDarkMode => _themeData == darkTheme;

  // TOGGLE THEME MODE
  void toggleThemeData() {
    if (_themeData == lightTheme) {
      _themeData = darkTheme;
    } else {
      _themeData = lightTheme;
    }
    _regenerateAnimationKey();
    notifyListeners();
  }

  // METHOD TO RECREATE ANIMATION OF THEME CHANGE BUTTON
  void _regenerateAnimationKey() {
    _animationKey = UniqueKey();
  }
}
