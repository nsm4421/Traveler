import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dependency_injection.dart';

import 'presentation/router/router_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  timeago.setLocaleMessages('ko', timeago.KoMessages());

  configureDependencies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'SOL2.0',
        routerConfig: getIt<CustomRouter>().routerConfig,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('ko', '82'),
        ]);
  }
}
