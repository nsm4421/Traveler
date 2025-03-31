import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:module/shared/shared.export.dart';

import '../../../router/router_config.dart';

part 's_auth.dart';

Page Function(BuildContext, GoRouterState) authPageBuilder = (context, state) {
  const view = AuthScreen();
  return const NoTransitionPage(child: view);
};
