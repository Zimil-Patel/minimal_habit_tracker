// GET IF HABIT IS COMPLETED TODAY OR NOT
import 'package:minimal_habit_tracker/models/habit.dart';

bool isHabitCompletedToday(List<DateTime> completedDays) {
  final today = DateTime.now();

  return completedDays.any((date) =>
      today.year == date.year &&
      today.month == date.month &&
      today.day == date.day);
}

// RETURN DATASET ACCORDING DATABASE
Map<DateTime, int> getDataSet(List<Habit> habitList) {
  Map<DateTime, int> dataset = {};

  for (var habit in habitList) {
    for (var date in habit.completedDays) {
      // NORMALIZING TIME TO PREVENT TIME MISMATCH
      final normalizedDate = DateTime(date.year, date.month, date.day);

      // IF DATE ALREADY EXISTS IN DATASET INCREMENT IT COUNT
      if (dataset.containsKey(normalizedDate)) {
        dataset[normalizedDate] = dataset[normalizedDate]! + 1;
      } else {
        // ELSE INITILIZE IT WITH 1
        dataset[normalizedDate] = 1;
      }
    }
  }

  return dataset;
}
