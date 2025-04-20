import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../../../../router/router_config.dart';
import '../../../../../widgets/carousel.widget.dart';
import '../../../../../widgets/conditional.widget.dart';

part 's_review_detail.dart';

Page Function(BuildContext, GoRouterState, ReviewEntity)
    reviewDetailPageBuilder = (context, state, entity) {
  final view = ReviewDetailScreen(entity);
  return NoTransitionPage(child: view);
};
