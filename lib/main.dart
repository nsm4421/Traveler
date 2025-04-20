import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'dependency_injection.dart';

import 'presentation/router/router_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  timeago.setLocaleMessages('ko', timeago.KoMessages());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WorkFlow',
      routerConfig: getIt<CustomRouter>().routerConfig,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
    );
  }
}
