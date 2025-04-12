import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/router_config.dart';

part 's_display_review.dart';

Page Function(BuildContext, GoRouterState) displayReviewPageBuilder =
    (context, state) {
  const view = DisplayReviewScreen();
  return const NoTransitionPage(child: view);
};
