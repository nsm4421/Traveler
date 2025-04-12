import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:module/dependency_injection.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/presentation/bloc/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../../../router/router_config.dart';
import '../../../../widgets/carousel.widget.dart';
import '../../../../widgets/conditional.widget.dart';

part 's_display_review.dart';

part 'f_review_list.dart';

part 'w_review_item.dart';

Page Function(BuildContext, GoRouterState) displayReviewPageBuilder =
    (context, state) {
  final view = BlocProvider(
      create: (_) => getIt<DisplayReviewBloc>()..add(MountDisplayEvent()),
      child: const DisplayReviewScreen());
  return NoTransitionPage(child: view);
};
