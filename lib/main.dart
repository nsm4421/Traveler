import 'package:flutter/material.dart';
import 'package:module/dependency_injection.dart';
import 'package:module/presentation/router/router_config.dart';

void main() {
  configureDependencies();  // 의존성 주입
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Travel App',
      routerConfig: getIt<CustomRouter>().routerConfig,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
    );
  }
}
