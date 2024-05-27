import 'package:isar/isar.dart';

// generate g.dart file using cmd: dart run build_runner build

part 'habit.g.dart';

// annotation of class with Collection()

@Collection()
class Habit {
  // HABIT ID
  Id id = Isar.autoIncrement;

  // HABIT NAME
  late String name;

  // HABIT COMPLETED DATE RECORDS
  List<DateTime> completedDays = [
    // DateTime(year, month, day),
    // DateTime(2024, 5, 27),
  ];
}
