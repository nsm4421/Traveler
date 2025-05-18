import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karma/dependency_injection.dart';
import 'package:karma/domain/entities/entities.export.dart';
import 'package:karma/presentation/providers/providers.export.dart';
import 'package:karma/presentation/widgets/custom_text_field.widget.dart';
import 'package:karma/presentation/widgets/loading_overlay.widget.dart';
import 'package:karma/shared/shared.export.dart';

part 's_create_repr_coverage.dart';
part 'f_define_gurantee.dart';
part 'w_name.dart';
part 'w_select_category.dart';
part 'w_gurantee.dart';
part 'w_benefit.dart';

class EditReprCoveragePage extends StatelessWidget {
  const EditReprCoveragePage(this._reprCoverage, {super.key});

  final ReprCoverageEntity? _reprCoverage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EditReprCoverageCubit>(param1: _reprCoverage),
      child: BlocBuilder<EditReprCoverageCubit, EditReprCoverageState>(
          builder: (context, state) {
        return LoadingOverlayWidget(
            message: '로딩중입니다',
            showOverlay: state.status != Status.initial,
            child: const EditReprCoverageScreen());
      }),
    );
  }
}
