import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal_habit_tracker/database/habit_database.dart';
import 'package:minimal_habit_tracker/models/habit.dart';
import 'package:minimal_habit_tracker/utils/constants.dart';
import 'package:provider/provider.dart';

class HabitListTile extends StatelessWidget {
  const HabitListTile({
    super.key,
    required this.habit,
    required this.isCompleted,
  });

  final Habit habit;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        // TOGGLE HABIT CHECK
        context
            .read<HabitDatabase>()
            .updateHabitCompletion(habit.id, !isCompleted);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isCompleted
              ? Colors.green.shade400
              : Theme.of(context).colorScheme.tertiary,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(defaultPadding),
          title: Text(
            habit.name,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.02,
                color: isCompleted
                    ? Colors.white
                    : Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w500),
          ),
          leading: Checkbox(
            activeColor: Colors.green.shade400,
            checkColor: Colors.white,
            value: isCompleted,
            // TOGGLE HABIT CHECK
            onChanged: (value) => context
                .read<HabitDatabase>()
                .updateHabitCompletion(habit.id, value!),
          ),
        ),
      ),
    );
  }
}
