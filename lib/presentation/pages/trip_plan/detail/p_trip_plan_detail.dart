import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:module/dependency_injection.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/presentation/bloc/export.dart';
import 'package:module/shared/shared.export.dart';

part 's_trip_plan_detail.dart';

part 'f_info.dart';

part 'f_display_apply.dart';

part 'f_create_apply.dart';

part 'w_apply_button.dart';

part 'w_switch_approval_button.dart';

part 'f_comment.dart';

Page Function(BuildContext, GoRouterState) tripPlanDetailPageBuilder =
    (context, state) {
  final tripPlan = state.extra as TripPlanEntity;
  final view = MultiBlocProvider(providers: [
    BlocProvider(
        create: (_) => getIt<DisplayJoinApplyBloc>(param1: tripPlan)
          ..add(MountDisplayEvent())),
    BlocProvider(
        create: (_) =>
            getIt<CreateTripPlanParentCommentCubit>(param1: tripPlan)),
    BlocProvider(
        create: (_) =>
            getIt<DisplayTripPlanParentCommentBloc>(param1: tripPlan))
  ], child: TripPlanDetailScreen(tripPlan));
  return NoTransitionPage(child: view);
};
