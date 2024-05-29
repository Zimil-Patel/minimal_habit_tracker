// GET IF HABIT IS COMPLETED TODAY OR NOT
bool isHabitCompletedToday(List<DateTime> completedDays) {
  final today = DateTime.now();

  return completedDays.any((date) =>
      today.year == date.year &&
      today.month == date.month &&
      today.day == date.day);
}
