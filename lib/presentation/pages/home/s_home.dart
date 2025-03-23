import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'w_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this._navigationShell, {super.key});

  final StatefulNavigationShell _navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navigationShell,
      bottomNavigationBar: HomeBottomNavWidget(_navigationShell),
    );
  }
}
