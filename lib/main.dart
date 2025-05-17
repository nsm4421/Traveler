import 'package:flutter/material.dart';

import 'dependency_injection.dart';
import 'presentation/routers/router_config.dart';

void main() async {
  configureDependencies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: getIt<CustomRouter>().routerConfig,
      theme: ThemeData.dark(),
    );
  }
}
