import 'package:flutter/material.dart';
import 'package:minimal_habi_tracker/animations/animated_theme_button.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const LinearBorder(),

      // ANIMATED BUTTON FOR THEME CHANGE
      child: const Center(
        child: AnimatedThemeButton(),
      ),
    );
  }
}
