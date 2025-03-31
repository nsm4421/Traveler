import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:module/dependency_injection.dart';
import 'package:module/presentation/bloc/export.dart';
import 'package:module/shared/shared.export.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../widgets/loading_overlay.widget.dart';
import '../../../widgets/text_field.widget.dart';

part 's_create_trip_plan.dart';

part 'f_form.dart';

part 'w_content.dart';

part 'w_hashtag.dart';

part 'w_head_count.dart';

part 'w_date.dart';

part 'w_submit_button.dart';

Page Function(BuildContext, GoRouterState) createTripPlanPageBuilder =
    (context, state) {
  final view = BlocProvider(
      create: (_) => getIt<CreateTripPlanCubit>(),
      child: const CreateTripScreen());
  return NoTransitionPage(child: view);
};

