import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:module/dependency_injection.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/usecase/export.dart';

import '../bloc/auth/sign_in/cubit.dart';
import '../bloc/auth/sign_up/cubit.dart';
import '../pages/auth/s_auth.dart';
import '../pages/auth/sign_in/s_sign_in.dart';
import '../pages/auth/sign_up/s_sign_up.dart';
import '../pages/home/s_home.dart';
import '../pages/journey/create/s_create_journey.dart';

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
          return Routes.home.path;
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
                builder: (context, state) => BlocProvider(
                    create: (_) => getIt<SignUpCubit>(),
                    child: SignUpScreen())),
            GoRoute(
                path: Routes.signIn.path.split('/').last,
                builder: (context, state) => BlocProvider(
                    create: (_) => getIt<SignInCubit>(), child: SignInScreen()))
          ]);

  StatefulShellRoute get _homeRouter => StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state, navigationShell) =>
          NoTransitionPage(child: HomeScreen(navigationShell)),
      branches: Routes.values.where((item) => !item.isAuthRoute).map((route) {
        final widget = switch (route) {
          Routes.createJourney => const CreateJourneyScreen(),
          // TODO : Not Found Page 만들기
          (_) => const Text("Path Not Found")
        };
        return StatefulShellBranch(
          routes: [
            GoRoute(
              path: route.path,
              pageBuilder: (context, state) {
                return NoTransitionPage(child: widget);
              },
            )
          ],
        );
      }).toList());
}
