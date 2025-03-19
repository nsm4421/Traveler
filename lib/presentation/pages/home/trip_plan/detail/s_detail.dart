import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:module/dependency_injection.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/presentation/bloc/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../../../widgets/loading_overlay.widget.dart';

part 'f_info.dart';

part 'f_display_apply.dart';

part 'f_create_apply.dart';

part 'w_apply_button.dart';

class TripPlanDetailScreen extends StatelessWidget {
  const TripPlanDetailScreen(this._entity, {super.key});

  final TripPlanEntity _entity;

  @override
  Widget build(BuildContext context) {
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
          DisplayApplyFragment(_entity),
        ],
      ),

    );
  }
}
