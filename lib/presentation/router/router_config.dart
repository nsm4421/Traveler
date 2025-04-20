import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:module/presentation/pages/home/home.page.dart';

part 'routes.dart';

@lazySingleton
class CustomRouter {
  late final GlobalKey<NavigatorState> _rootNavigatorKey;

  CustomRouter() {
    _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  }

  @lazySingleton
  GoRouter get routerConfig => GoRouter(
        initialLocation: Routes.home.path,
        navigatorKey: _rootNavigatorKey,
        routes: [
          GoRoute(path: Routes.home.path, builder: (_, __) => const HomePage()),
        ],
      );
}
