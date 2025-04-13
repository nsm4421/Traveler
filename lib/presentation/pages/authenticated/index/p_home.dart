import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:module/dependency_injection.dart';
import 'package:module/presentation/bloc/export.dart';
import 'package:module/shared/shared.export.dart';

part 's_home.dart';

part 'w_bottom_nav.dart';

Page Function(BuildContext, GoRouterState, StatefulNavigationShell)
    homePageBuilder = (context, state, navigationShell) {
  final view = BlocProvider(
    create: (_) => getIt<HomeBottomNavCubit>(),
    child: HomeScreen(navigationShell),
  );
  return NoTransitionPage(child: view);
};
