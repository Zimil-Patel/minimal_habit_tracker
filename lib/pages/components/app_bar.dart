import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal_habi_tracker/animations/animated_theme_button.dart';
import 'package:minimal_habi_tracker/utils/constants.dart';

AppBar apppBar(GlobalKey<ScaffoldState> scaffoldKey) {
  return AppBar(
    title: const Text(
      'Habit Tracker',
      style: TextStyle(fontWeight: FontWeight.w600),
    ),
    centerTitle: false,

    // LEADING ICONS
    leading: CupertinoButton(
      onPressed: () {
        scaffoldKey.currentState?.openDrawer();
      },
      padding: EdgeInsets.zero,
      child: const Icon(
        Icons.menu_rounded,
        size: 30,
      ),
    ),

    // ACTION BUTTONS
    actions: const [
      // ANIMATED THEME BCHANGE BUTTON
      Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: AnimatedThemeButton(
          size: 30,
        ),
      ),
    ],
  );
}
