import 'package:flutter/material.dart';
import 'package:minimal_habit_tracker/components/create_new_habit_button.dart';

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
    );
  }
}
