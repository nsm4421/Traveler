import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:module/dependency_injection.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/presentation/bloc/base/comment/display/abs_display_comment.bloc.dart';
import 'package:module/presentation/bloc/export.dart';
import 'package:module/presentation/widgets/conditional.widget.dart';
import 'package:module/shared/shared.export.dart';

import '../../../../../widgets/loading_overlay.widget.dart';

part 's_review_comment.dart';

part 'f_display_comment.dart';

part 'w_comment_text_field.dart';

Page Function(BuildContext, GoRouterState, ReviewEntity)
    reviewCommentPageBuilder = (context, state, entity) {
  final view = MultiBlocProvider(providers: [
    BlocProvider(
        create: (_) => getIt<DisplayParentReviewCommentBloc>(param1: entity)
          ..add(MountDisplayEvent())),
    BlocProvider(
        create: (_) => getIt<CreateParentReviewCommentCubit>(param1: entity)),
  ], child: const ReviewCommentScreen());
  return NoTransitionPage(child: view);
};
