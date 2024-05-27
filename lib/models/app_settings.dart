import 'package:isar/isar.dart';

// generate g.dart file using cmd: dart run build_runner build

part 'app_settings.g.dart';

// annotation of class with Collection()

@Collection()
class AppSettings {
  Id id = Isar.autoIncrement;
  DateTime? firstLaunchDate;
}
