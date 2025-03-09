import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import 'package:module/dependency_injection.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/presentation/bloc/export.dart';
import 'package:module/presentation/bloc/trip_plan/create/cubit.dart';

import '../pages/auth/s_auth.dart';
import '../pages/auth/sign_in/s_sign_in.dart';
import '../pages/auth/sign_up/s_sign_up.dart';
import '../pages/home/create_trip/s_create_trip.dart';
import '../pages/home/display_trip/s_display_trip.dart';
import '../pages/home/s_home.dart';
import '../pages/home/setting/s_setting.dart';

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
        routes: [_authRoutes, _homeRouter],
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

  RouteBase get _authRoutes => GoRoute(
          path: Routes.auth.path,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: AuthScreen()),
          routes: [
            GoRoute(
                path: Routes.signUp.path.split('/').last,
                builder: (context, state) => const SignUpScreen()),
            GoRoute(
                path: Routes.signIn.path.split('/').last,
                builder: (context, state) => const SignInScreen())
          ]);

  StatefulShellRoute get _homeRouter => StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state, navigationShell) => NoTransitionPage(
              child: BlocProvider(
            create: (_) => getIt<HomeBottomNavCubit>(),
            child: HomeScreen(navigationShell),
          )),
      branches: HomeBottomNav.values
          .map((item) => switch (item) {
                HomeBottomNav.home => StatefulShellBranch(
                    routes: [
                      GoRoute(
                        path: Routes.displayTrip.path,
                        pageBuilder: (context, state) =>
                            const NoTransitionPage(child: DisplayTripScreen()),
                      )
                    ],
                  ),
                HomeBottomNav.createTrip => StatefulShellBranch(
                    routes: [
                      GoRoute(
                        path: Routes.createTrip.path,
                        pageBuilder: (context, state) => NoTransitionPage(
                            child: BlocProvider(
                                create: (_) => getIt<CreateTripPlanCubit>(),
                                child: const CreateTripScreen())),
                      )
                    ],
                  ),
                HomeBottomNav.setting => StatefulShellBranch(
                    routes: [
                      GoRoute(
                        path: Routes.setting.path,
                        pageBuilder: (context, state) =>
                            const NoTransitionPage(child: SettingScreen()),
                      )
                    ],
                  ),
              })
          .toList());
}
