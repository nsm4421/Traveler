import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:module/dependency_injection.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/presentation/bloc/export.dart';
import 'package:module/presentation/bloc/trip_plan/join_apply/approval/accept_join_apply.cubit.dart';
import 'package:module/shared/shared.export.dart';

import '../../../../bloc/trip_plan/join_apply/display/display_join_apply.bloc.dart';

part 'f_info.dart';

part 'f_display_apply.dart';

part 'f_create_apply.dart';

part 'w_apply_button.dart';

part 'w_switch_approval_button.dart';

class TripPlanDetailScreen extends StatelessWidget {
  const TripPlanDetailScreen(this._entity, {super.key});

  final TripPlanEntity _entity;

  @override
  Widget build(BuildContext context) {
    final currentUid = context.read<AuthenticationBloc>().currentUid;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              if (context.mounted) {
                context.pop();
              }
            },
            icon: const Icon(Icons.clear)),
        title: const Text('상세 페이지', overflow: TextOverflow.ellipsis),
        centerTitle: true,
      ),
      body: Column(
        children: [
          InfoFragment(_entity),
          BlocBuilder<DisplayJoinApplyBloc, DisplayState<JoinApplyEntity>>(
            builder: (context, state) {
              final applies =
                  state.data.where((item) => item.creator.id != currentUid);
              return applies.isEmpty
                  ? Center(
                      child: Text(
                        "아직 지원자가 없습니다.\n첫번째 지원자가 되어보세요",
                        style: context.textTheme.labelLarge,
                      ),
                    )
                  : DisplayApplyFragment(
                      tripPlan: _entity, applies: applies.toList());
            },
          ),
        ],
      ),
    );
  }
}
