import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:module/presentation/bloc/export.dart';
import 'package:module/shared/shared.export.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../bloc/trip_plan/create/cubit.dart';
import '../../../widgets/loading_overlay.widget.dart';
import '../../../widgets/text_field.widget.dart';

part 'f_form.dart';

part 'w_content.dart';

part 'w_hashtag.dart';

part 'w_head_count.dart';

part 'w_date.dart';

part 'w_submit_button.dart';

class CreateTripScreen extends StatelessWidget {
  const CreateTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateTripPlanCubit, CreateTripPlanState>(
      listener: (context, state) {
        if (state.status == Status.error) {
          Timer(1.durationInSec, () {
            if (context.mounted) {
              context
                  .read<CreateTripPlanCubit>()
                  .initState(status: Status.initial, errorMessage: '');
            }
          });
        } else if (state.status == Status.success) {
          Timer(1.durationInSec, () {
            if (context.mounted) {
              context.pop();
            }
          });
        }
      },
      child: BlocBuilder<CreateTripPlanCubit, CreateTripPlanState>(
          builder: (context, state) {
        return LoadingOverLayWidget(
            isLoading: state.status != Status.initial,
            loadingWidget: const Center(child: CircularProgressIndicator()),
            child: Scaffold(
              appBar: AppBar(
                title: const Text("여행계획 짜기"),
                elevation: 0,
                actions: const [SubmitButtonWidget()],
              ),
              body: const SingleChildScrollView(
                child: CreateTripFormFragment(),
              ),
            ));
      }),
    );
  }
}
