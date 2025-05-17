import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:go_router/go_router.dart';
import 'package:karma/domain/entities/entities.export.dart';
import 'package:karma/presentation/screens/screens.export.dart';

part 'routes.dart';

@lazySingleton
class CustomRouter {
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
            builder: (_, __) => const IndexScreen(),
          ),
          GoRoute(
              // 대표담보 조회 페이지
              path: Routes.reprCoverages.path,
              builder: (_, __) => const ReprCoverageScreen(),
              routes: [
                // 대표담보 생성 페이지
                GoRoute(
                    path:
                        Routes.createReprCoverages.path.split('/').lastOrNull ??
                            'create',
                    builder: (_, state) => const CreateReprCoveragePage()),

                // 대표담보 수정 페이지
                GoRoute(
                  path: Routes.editReprCoverages.path.split('/').lastOrNull ??
                      'edit',
                  builder: (_, state) {
                    final reprCoverage = state.extra as ReprCoverageEntity;
                    return EditReprCoverageScreen(reprCoverage);
                  },
                )
              ])
        ],
      );
}
