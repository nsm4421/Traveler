import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../../bloc/base_state.dart';
import '../../../bloc/trip_plan/display/bloc.dart';
import '../../../router/router_config.dart';
import '../../../widgets/loading_overlay.widget.dart';

part 'f_list.dart';

part 'w_item.dart';

class MyTripScreen extends StatelessWidget {
  const MyTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DisplayTripPlanBloc, DisplayState<TripPlanEntity>>(
      listener: (context, state) {
        if (state.status == Status.error) {
          Timer(1.durationInSec, () {
            if (context.mounted) {
              context.read<DisplayTripPlanBloc>().add(InitDisplayTripPlanEvent(
                  status: Status.initial, errorMessage: ''));
            }
          });
        }
      },
      child: BlocBuilder<DisplayTripPlanBloc, DisplayState<TripPlanEntity>>(
        builder: (context, state) {
          return LoadingOverLayWidget(
            isLoading: (state.status == Status.loading),
            child: Scaffold(
                appBar: AppBar(
                  title: const Text('My Trip'),
                  actions: [
                    IconButton(
                      onPressed: () {
                        context.push(Routes.createTrip.path);
                      },
                      icon: const Icon(Icons.add_box_outlined),
                    )
                  ],
                ),
                body: RefreshIndicator(
                    onRefresh: () async {
                      context
                          .read<DisplayTripPlanBloc>()
                          .add(RefreshDisplayTripPlanEvent());
                    },
                    child: TripPlanListFragment(state.data))),
          );
        },
      ),
    );
  }
}
