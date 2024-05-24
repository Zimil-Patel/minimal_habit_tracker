import 'package:flutter/material.dart';
import 'package:minimal_habi_tracker/animations/animated_theme_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        shape: const LinearBorder(),
        child: const Center(
          child: AnimatedThemeButton(),
        ),
      ),
    );
  }
}
