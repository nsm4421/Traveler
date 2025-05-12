import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dependency_injection.dart';

import 'presentation/router/router_config.dart';
import 'shared/utils/env/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: Env.supabaseApiUrl,
    anonKey: Env.supabaseAnonKey,
    debug: Env.mode == 'development',
  ); // 슈파베이스 초기화

  timeago.setLocaleMessages('ko', timeago.KoMessages());

  configureDependencies(); // 의존성 주입

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
        fontFamily: 'NanumGothic',
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', ''), Locale('ko', '82')],
    );
  }
}
