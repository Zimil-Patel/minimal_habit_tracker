import 'package:flutter/material.dart';
import 'package:minimal_habi_tracker/pages/home_page.dart';
import 'package:minimal_habi_tracker/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const MinimalHabitTracker(),
    ),
  );
}

class MinimalHabitTracker extends StatelessWidget {
  const MinimalHabitTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const HomePage(),
    );
  }
}
