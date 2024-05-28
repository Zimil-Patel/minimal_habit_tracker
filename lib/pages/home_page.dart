import 'package:flutter/material.dart';
import 'package:minimal_habi_tracker/components/app_bar.dart';
import 'package:minimal_habi_tracker/components/side_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      // APPBAR
      appBar: apppBar(scaffoldKey),

      // DRAWER
      drawer: const SideDrawer(),

      // FLAOTING ACTION BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        onPressed: () {},
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
