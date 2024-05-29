import 'package:flutter/material.dart';
import 'package:minimal_habit_tracker/components/my_heat_map.dart';
import 'package:minimal_habit_tracker/database/habit_database.dart';
import 'package:minimal_habit_tracker/models/habit.dart';
import 'package:minimal_habit_tracker/utils/habit_utils.dart';
import 'package:provider/provider.dart';

class BuildHeatMap extends StatelessWidget {
  const BuildHeatMap({super.key});

  @override
  Widget build(BuildContext context) {
    final habitDatabse = context.watch<HabitDatabase>();

    List<Habit> habitList = habitDatabse.currentHabitList;

    return FutureBuilder(
      future: habitDatabse.getFirstAppLaunchDate(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MyHeatMap(
            startDate: snapshot.data!,
            dataset: getDataSet(habitList),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
