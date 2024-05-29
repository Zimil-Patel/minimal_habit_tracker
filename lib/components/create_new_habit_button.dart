import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal_habit_tracker/database/habit_database.dart';
import 'package:provider/provider.dart';

class CreateNewHabitButton extends StatelessWidget {
  const CreateNewHabitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TEXT EDITING CONTROLLER FOR NEW HABIT INPUT
    TextEditingController txtHabit = TextEditingController();

    // CREATE NEW HABIT ON FLOATING ACTION BUTTON PRESS
    createNewHabit() {
      // SHOW ALTER DIALOG FOR HABIT INPUT
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('New Habit'),
          content: TextField(
            controller: txtHabit,
            cursorColor: Theme.of(context).colorScheme.onSurface,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8)),
              hintText: 'Create new habit',
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
              )),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onSurface,
                      width: 2)),
            ),
          ),
          actions: [
            // CANCEL BUTTON
            CupertinoButton(
              onPressed: () {
                // POP
                Navigator.pop(context);

                // CLEAR TEXT FIELD
                txtHabit.clear();
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
                  context.read<HabitDatabase>().addNewHabit(name);
                }

                // CLEAR TEXT FIELD
                txtHabit.clear();
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

    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      onPressed: () => createNewHabit(),
      shape: const CircleBorder(),
      child: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
