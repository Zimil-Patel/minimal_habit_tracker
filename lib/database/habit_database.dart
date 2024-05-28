import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';

import '../models/app_settings.dart';
import '../models/habit.dart';

class HabitDatabase extends ChangeNotifier {
  static late Isar isar;

  // initialization of database
  static Future<void> initializeDatabase() async {
    final directory = await getApplicationCacheDirectory();

    // OPENING ISAR DATABASE WITH CREATED SCHEMA
    isar = await Isar.open([HabitSchema, AppSettingsSchema],
        directory: directory.path);
  }

  // save first app launch date for heatmap
  Future<void> saveFirstAppLaunchDate() async {
    // GETTING FIRST RECORD FROM APP SETTINGS TABLE
    final existingSettings = await isar.appSettings.where().findFirst();
    // IF NOT EXISTS SAVE FIRST LAUNCH DATE
    if (existingSettings == null) {
      final settings = AppSettings()..firstLaunchDate = DateTime.now();
      await isar.writeTxn(() => isar.appSettings.put(settings));
    }
  }

  // get first date of app startup for heatmap
  Future<DateTime?> getFirstAppLaunchDate() async {
    final setttings = await isar.appSettings.where().findFirst();
    return setttings!.firstLaunchDate;
  }

  // CREATE, READ, UPDATE, DELETE (habit operations)

  // List of habits
  List<Habit> currentHabitList = [];

  // READ - read saved habits from database
  Future<void> readAllHabits() async {
    // FETCH ALL HABITS FROM DATABASE
    List<Habit> fetchedHabits = await isar.habits.where().findAll();

    //CLEAR CURRENT HABIT LIST
    currentHabitList.clear();

    // ADD NEW FETCHED HABIT LIST TO CURRENT HABIT LIST
    currentHabitList.addAll(fetchedHabits);

    // UPDATE UI
    notifyListeners();
  }

  // CREATE - add a new habit
  Future<void> addNewHabit(String habitName) async {
    // CREATE NEW HABIT OBJECT
    final newHabit = Habit()..name = habitName;

    // PUT NEW HABIT INTO DATABASE
    await isar.writeTxn(() => isar.habits.put(newHabit));

    // RE-READ HABIT FOR UI UPDATE
    await readAllHabits();
  }

  // UPDATE - toggle habit (on / off)
  Future<void> updateHabitCompletion(int id, bool isCompleted) async {
    // FIND SPECIFIC HABIT
    final habit = await isar.habits.get(id);

    if (habit != null) {
      isar.writeTxn(() async {
        // IF HABIT IS COMPLETED : ADD CURRENT DATETIME TO CURRENT HABIT OBJECT OF DATABASE
        if (isCompleted) {
          final today = DateTime.now();

          // ADD CURRENT DATE IF NOT EXISTS ALREADY IN LIST
          habit.completedDays.add(DateTime(today.year, today.month, today.day));
        }
        // IF HABIT IS COMPLETED : REMOVE CURRENT DATETIME TO CURRENT HABIT OBJECT OF DATABASE
        else {
          // REMOVE CURRENT DATE FROM HABIT IF IT MARKED AS NOT COMPLETED
          habit.completedDays.removeWhere((date) =>
              date.year == DateTime.now().year &&
              date.month == DateTime.now().month &&
              date.day == DateTime.now().day);
        }

        await isar.habits.put(habit);
      });
    }

    // RE-READ HABIT FOR UI UPDATE
    readAllHabits();
  }

  // UPDATE - change habit name
  Future<void> updateHabitName(int id, String newHabitName) async {
    // FETCH SPECIFIC HABIT
    final habit = await isar.habits.get(id);

    // UPDATE HABIT NAME
    if (habit != null) {
      // UPDATE NAME TO OBJECT
      await isar.writeTxn(() async {
        habit.name = newHabitName;
        // SAVE UPDATED OBJECT OF HABIT TO DATABASE
        await isar.habits.put(habit);
      });
    }

    // RE-READ HABIT FOR UI UPDATE
    readAllHabits();
  }

  // DELETE - delete habit from database
  Future<void> deleteHabit(int id) async {
    // DELETE HABIT WHERE ID MATCHES
    await isar.writeTxn(() async {
      await isar.habits.delete(id);
    });

    // RE-READ HABIT FOR UI UPDATE
    readAllHabits();
  }
}
