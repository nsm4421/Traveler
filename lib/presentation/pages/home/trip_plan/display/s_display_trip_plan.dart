import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:module/dependency_injection.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/presentation/bloc/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../../../router/router_config.dart';
import '../../../../widgets/loading_overlay.widget.dart';
import '../join_apply/create/s_create_join_apply.dart';

part 'f_list.dart';

part 'w_item.dart';

class DisplayTripPlanScreen extends StatelessWidget {
  const DisplayTripPlanScreen(this.titleText, {super.key});

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DisplayTripPlanBloc, DisplayState<TripPlanEntity>>(
      listener: (context, state) {
        if (state.status == Status.error) {
          Timer(1.durationInSec, () {
            if (context.mounted) {
              context.read<DisplayTripPlanBloc>().add(
                  InitDisplayEvent(status: Status.initial, errorMessage: ''));
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
                  title: Text(titleText),
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
                          .add(RefreshDisplayEvent());
                    },
                    child: TripPlanListFragment(state.data))),
          );
        },
      ),
    );
  }
}
