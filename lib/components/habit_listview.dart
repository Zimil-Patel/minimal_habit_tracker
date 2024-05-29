import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:minimal_habit_tracker/components/habit_list_tile.dart';
import 'package:minimal_habit_tracker/database/habit_database.dart';
import 'package:minimal_habit_tracker/models/habit.dart';
import 'package:minimal_habit_tracker/utils/constants.dart';
import 'package:minimal_habit_tracker/utils/habit_utils.dart';
import 'package:provider/provider.dart';

class BuildHabitList extends StatelessWidget {
  const BuildHabitList({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen to HabitDatabase changes
    final habitDatabase = context.watch<HabitDatabase>();
    List<Habit> habitList = habitDatabase.currentHabitList;

    return ListView(
      children: List.generate(
        habitList.length,
        (index) {
          final habit = habitList[index];
          bool isCompleted = isHabitCompletedToday(habit.completedDays);

          return Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Slidable(
                endActionPane: ActionPane(
                  motion: const StretchMotion(),
                  children: [
                    // EDIT ACTION
                    SlidableAction(
                      onPressed: (context) => editHabit(context, habit),
                      backgroundColor: Colors.grey.shade600,
                      icon: Icons.edit,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),

                    // DELETE ACTION
                    SlidableAction(
                      onPressed: (context) =>
                          context.read<HabitDatabase>().deleteHabit(habit.id),
                      backgroundColor: Colors.red.shade400,
                      icon: Icons.delete,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  ],
                ),
                child: HabitListTile(habit: habit, isCompleted: isCompleted)),
          );
        },
      ),
    );
  }
}

// EDIT HABIT
editHabit(BuildContext context, Habit habit) {
  TextEditingController txtHabit = TextEditingController(text: habit.name);

  // SHOW ALTER DIALOG FOR HABIT INPUT
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Edit Habit'),
      content: TextField(
        controller: txtHabit,
        cursorColor: Theme.of(context).colorScheme.onSurface,
        decoration: InputDecoration(
          hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8)),
          hintText: 'Create new habit',
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
          )),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface, width: 2)),
        ),
      ),
      actions: [
        // CANCEL BUTTON
        CupertinoButton(
          onPressed: () {
            // POP
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface),
          ),
        ),

        // SAVE BUTTON
        CupertinoButton(
          onPressed: () {
            // GET HABIT NAME
            String name = txtHabit.text;

            // POP
            Navigator.pop(context);

            // SAVE TO DATABASE
            if (name.isNotEmpty && name != '') {
              // Provider.of<HabitDatabase>(context, listen: false).addNewHabit(name);
              // OR
              context.read<HabitDatabase>().updateHabitName(habit.id, name);
            }
          },
          child: Text(
            'Save',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
      ],
    ),
  );
}
