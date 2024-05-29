import 'package:flutter/material.dart';
import 'package:minimal_habit_tracker/pages/home_page.dart';
import 'package:minimal_habit_tracker/theme/dark_theme_data.dart';
import 'package:minimal_habit_tracker/theme/light_theme_data.dart';
import 'package:minimal_habit_tracker/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'database/habit_database.dart';

void main() async {
  // Ensure the widget binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize ThemeProvider and load theme preferences
  final themeProvider = ThemeProvider();
  await themeProvider.checkForThemePreference();

  // Initialize HabitDatabase
  await HabitDatabase.initializeDatabase();
  await HabitDatabase().saveFirstAppLaunchDate();

  runApp(
    MultiProvider(
      providers: [
        // HABIT PROVIDER
        ChangeNotifierProvider(create: (context) => HabitDatabase()),

        // THEME PROVIDER
        ChangeNotifierProvider(create: (context) => themeProvider),
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
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: Provider.of<ThemeProvider>(context).isDark
          ? ThemeMode.dark
          : ThemeMode.light,
      home: const HomePage(),
    );
  }
}
