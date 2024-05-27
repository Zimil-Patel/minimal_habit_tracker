import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal_habi_tracker/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class AnimatedThemeButton extends StatelessWidget {
  const AnimatedThemeButton({
    super.key,
    this.size = 40,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    log('------------------------- Animation screen rebuild -------------------------');
    return TweenAnimationBuilder(
      // key: Provider.of<ThemeProvider>(context).animationKey,
      tween: Tween<double>(begin: 10, end: size),
      duration: const Duration(milliseconds: 400),
      builder: (context, value, child) => CupertinoButton(
        onPressed: () {
          Provider.of<ThemeProvider>(context, listen: false).toggleThemeData();
        },
        padding: EdgeInsets.zero,
        child: Provider.of<ThemeProvider>(context).isDarkMode
            ? AnimatedIcon(
                begin: 1,
                end: 6,
                size: value,
                icon: Icons.nightlight_rounded,
              )
            : AnimatedIcon(
                begin: 6,
                end: 1,
                size: value,
                icon: Icons.sunny,
              ),
      ),
    );
  }
}

class AnimatedIcon extends StatelessWidget {
  const AnimatedIcon({
    super.key,
    required this.begin,
    required this.end,
    required this.size,
    required this.icon,
  });

  final double begin, end, size;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: begin, end: end),
      duration: const Duration(milliseconds: 400),
      builder: (context, angle, child) => Transform.rotate(
        angle: angle,
        child: Icon(
          icon,
          size: size,
        ),
      ),
    );
  }
}
