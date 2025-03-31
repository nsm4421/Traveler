import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import 'package:module/domain/entity/export.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/presentation/bloc/export.dart';

import '../pages/auth/index/p_auth.dart';
import '../pages/auth/sign_in/p_sign_in.dart';
import '../pages/auth/sign_up/p_sign_up.dart';
import '../pages/home/index/p_home.dart';
import '../pages/home/review/p_display_review.dart';
import '../pages/home/search/p_search.dart';
import '../pages/trip_plan/create/p_create_trip_plan.dart';
import '../pages/trip_plan/detail/p_trip_plan_detail.dart';
import '../pages/home/trip_plan/p_display_trip_plan.dart';
import '../pages/home/setting/p_setting.dart';

part 'routes.dart';

@lazySingleton
class CustomRouter {
  final AuthUseCase _authUseCase;
  late ValueNotifier<bool> _isAuth;
  late StreamSubscription<UserEntity?> _authSubscription;
  late final GlobalKey<NavigatorState> _rootNavigatorKey;

  CustomRouter(this._authUseCase) {
    _isAuth = ValueNotifier(false);
    _authSubscription = _authUseCase.authStream.listen((data) {
      _isAuth.value = (data != null);
    });
    _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  }

  @lazySingleton
  GoRouter get routerConfig => GoRouter(
        initialLocation: Routes.auth.path,
        navigatorKey: _rootNavigatorKey,
        redirect: _redirect,
        refreshListenable: _isAuth,
        routes: [_authRoutes, _homeRouter, ..._routes],
      );

  FutureOr<String?> Function(BuildContext, GoRouterState) get _redirect =>
      (context, state) {
        final isAuthRoute = Routes.values
            .where((item) => item.isAuthRoute)
            .map((item) => item.path)
            .contains(state.matchedLocation);
        if (_isAuth.value && isAuthRoute) {
          return Routes.values.firstWhere((item) => item.isHomeRoute).path;
        } else if (!_isAuth.value && !isAuthRoute) {
          return Routes.signIn.path;
        } else {
          return null;
        }
      };

  RouteBase get _authRoutes =>
      GoRoute(path: Routes.auth.path, pageBuilder: authPageBuilder, routes: [
        GoRoute(
            path: Routes.signUp.path.split('/').last,
            pageBuilder: signUpPageBuilder),
        GoRoute(
            path: Routes.signIn.path.split('/').last,
            pageBuilder: signInPageBuilder)
      ]);

  StatefulShellRoute get _homeRouter => StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: homePageBuilder,
      branches: HomeBottomNav.values
          .map((item) => switch (item) {
                HomeBottomNav.displayReview => StatefulShellBranch(routes: [
                    GoRoute(
                        path: Routes.displayReview.path,
                        pageBuilder: displayReviewPageBuilder)
                  ]),
                HomeBottomNav.displayTripPlan => StatefulShellBranch(routes: [
                    GoRoute(
                        path: Routes.displayTrip.path,
                        pageBuilder: displayDisplayTripPlanPageBuilder)
                  ]),
                HomeBottomNav.search => StatefulShellBranch(routes: [
                    GoRoute(
                        path: Routes.search.path,
                        pageBuilder: searchPagePageBuilder)
                  ]),
                HomeBottomNav.setting => StatefulShellBranch(routes: [
                    GoRoute(
                        path: Routes.setting.path,
                        pageBuilder: settingPageBuilder)
                  ])
              })
          .toList());

  List<RouteBase> get _routes => [
        GoRoute(
            path: Routes.createTripPlan.path,
            pageBuilder: createTripPlanPageBuilder),
        GoRoute(
          path: Routes.tripPlanDetail.path,
          pageBuilder: tripPlanDetailPageBuilder,
        )
      ];
}
