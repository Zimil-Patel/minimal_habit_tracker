import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:minimal_habi_tracker/pages/components/app_bar.dart';
import 'package:minimal_habi_tracker/pages/components/side_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    // PRINT MESSAGE WHEN WHOLE SCREEN GET REBUILT
    log('------------------------- Home page rebuild -------------------------');
    return Scaffold(
      key: scaffoldKey,
      appBar: apppBar(scaffoldKey),
      drawer: const SideDrawer(),
    );
  }
}
