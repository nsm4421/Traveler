import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:go_router/go_router.dart';
import 'package:karma/domain/entities/entities.export.dart';
import 'package:karma/domain/entities/product/unit_product.entity.dart';
import 'package:karma/domain/entities/product/unit_product_history.entity.dart';
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
            builder: (_, __) => const IndexPage(),
          ),
          GoRoute(
              // 대표담보 조회 페이지
              path: Routes.reprCoverages.path,
              builder: (_, __) => const ReprCoveragePage(),
              routes: [
                // 대표담보 수정 페이지
                GoRoute(
                    path: Routes.editReprCoverages.path.split('/').lastOrNull ??
                        'edit',
                    builder: (_, state) {
                      final reprCoverage = state.extra as ReprCoverageEntity?;
                      return EditReprCoveragePage(reprCoverage);
                    }),
              ]),
          GoRoute(
              path: Routes.productModeing.path,
              builder: (_, state) {
                final _mockData = UnitProductHistoryEntity(
                    code: '6CCCC',
                    name: '(무) 메리츠 통합간편건강보험(일반심사형)2504',
                    startDate: DateTime(2025, 4, 1),
                    endDate: DateTime(9999, 12, 31));
                // final e = state.extra as UnitProductHistoryEntity;
                // return ProductModeingPage(e);
                return ProductModeingPage(_mockData);
              }),
        ],
      );
}
