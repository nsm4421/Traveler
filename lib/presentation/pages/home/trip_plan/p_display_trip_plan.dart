import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:module/dependency_injection.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/presentation/bloc/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../../router/router_config.dart';
import '../../../widgets/loading_overlay.widget.dart';

part 's_display_trip_plan.dart';

part 'f_list.dart';

part 'w_item.dart';

Page Function(BuildContext, GoRouterState) displayDisplayTripPlanPageBuilder =
    (context, state) {
  final view = BlocProvider(
      create: (_) => getIt<DisplayTripPlanBloc>()..add(MountDisplayEvent()),
      child: const DisplayTripPlanScreen('Trip Plans'));
  return NoTransitionPage(child: view);
};
