import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:minimal_habit_tracker/components/create_new_habit_button.dart';
import 'package:minimal_habit_tracker/database/habit_database.dart';
import 'package:minimal_habit_tracker/models/habit.dart';
import 'package:minimal_habit_tracker/theme/theme_provider.dart';
import 'package:minimal_habit_tracker/utils/constants.dart';
import 'package:minimal_habit_tracker/utils/habit_utils.dart';
import 'package:provider/provider.dart';

import '../components/app_bar.dart';
import '../components/side_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      // APPBAR
      appBar: appBar(scaffoldKey),

      // DRAWER
      drawer: const SideDrawer(),

      // FLOATING ACTION BUTTON
      floatingActionButton: const CreateNewHabitButton(),

      // BODY
      body: Consumer<ThemeProvider>(
          builder: (context, value, child) => const BuildHabitList()),
    );
  }
}

class BuildHabitList extends StatelessWidget {
  const BuildHabitList({super.key});

  @override
  Widget build(BuildContext context) {
    log('------------------- HabitList Created -------------------');

    // Listen to HabitDatabase changes
    final habitDatabase = context.watch<HabitDatabase>();
    List<Habit> habitList = habitDatabase.currentHabitList;

    return ListView.builder(
      itemCount: habitList.length,
      itemBuilder: (context, index) {
        final habit = habitList[index];
        bool isCompleted = isHabitCompletedToday(habit.completedDays);

        return Container(
          margin: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.tertiary,
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(defaultPadding),
            title: Text(habit.name),
            leading: Checkbox(
              value: isCompleted,
              onChanged: (value) => context
                  .read<HabitDatabase>()
                  .updateHabitCompletion(habit.id, value!),
            ),
          ),
        );
      },
    );
  }
}


// Container(
//       height: 200,
//       width: double.infinity,
//       margin: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.tertiary,
//       ),
//     );