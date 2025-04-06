import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module/dependency_injection.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/presentation/bloc/base/comment/display/abs_display_comment.bloc.dart';
import 'package:module/presentation/bloc/export.dart';
import 'package:module/shared/shared.export.dart';

part 's_trip_plan_detail_comment.dart';

part 'f_display_trip_plan_detail_comment.dart';

part 'w_trip_plan_detail_comment_text_field.dart';

class TripPlanDetailCommentPage extends StatelessWidget {
  const TripPlanDetailCommentPage(this._tripPlan, {super.key});

  final TripPlanEntity _tripPlan;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (_) =>
              getIt<DisplayTripPlanParentCommentBloc>(param1: _tripPlan)
                ..add(MountDisplayEvent())),
      BlocProvider(
          create: (_) =>
              getIt<CreateTripPlanParentCommentCubit>(param1: _tripPlan))
    ], child: const TripPlanDetailCommentScreen());
  }
}
