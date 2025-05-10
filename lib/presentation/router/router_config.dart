import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:module/presentation/pages/entry.page.dart';
import 'package:module/presentation/pages/not-found.page.dart';
import 'package:module/presentation/pages/repr-coverage/create/create-repr-coverage.page.dart';
import 'package:module/presentation/pages/repr-coverage/repr-coverage.page.dart';
import 'package:module/shared/export.dart';

part 'routes.dart';

@lazySingleton
class CustomRouter with LoggerMixIn {
  late final GlobalKey<NavigatorState> _rootNavigatorKey;

  CustomRouter() {
    _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  }

  @lazySingleton
  GoRouter get routerConfig => GoRouter(
        initialLocation: Routes.entry.path,
        navigatorKey: _rootNavigatorKey,
        routes: [
          GoRoute(
            // 시작 페이지
            path: Routes.entry.path,
            builder: (_, __) => const EntryPage(),
          ),
          GoRoute(
              // 대표담보 페이지
              path: Routes.reprCoverage.path,
              builder: (_, __) => const ReprCoveragePage(),
              routes: [
                GoRoute(
                  // 대표담보 생성 페이지
                  path: Routes.createReprCoverage.path.split('/').last,
                  builder: (_, state) {
                    try {
                      final coverageType = state.extra as CoverageType;
                      return CreateReprCoveragePage(coverageType);
                    } catch (error) {
                      logger.logErrorOnPresentation(error);
                      return const NotFoundPage();
                    }
                  },
                ),
              ]),
        ],
      );
}
