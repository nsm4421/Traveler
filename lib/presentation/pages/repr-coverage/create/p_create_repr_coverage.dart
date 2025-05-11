import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module/dependency_injection.dart';
import 'package:module/presentation/bloc/repr-coverage/create/create_repr_coverage.cubit.dart';
import 'package:module/shared/export.dart';

part 's_create_repr_coverage.dart';
part 'w_edit_coverage_name.dart';
part 'w_edit_coverage_category.dart';
part 'w_edit_benefit.dart';

class CreateReprCoveragePage extends StatelessWidget {
  const CreateReprCoveragePage(this._coverageType, {super.key});

  final CoverageType _coverageType;

  @override
  Widget build(BuildContext context) {
    return switch (_coverageType) {
      // 담보 1개 <-> 급부 1개
      CoverageType.singleBenefit => BlocProvider(
          create: (_) => getIt<CreateSingleBenefitReprCoverageCubit>(),
          child: CreateRepresentCoverageScreen(_coverageType),
        ),
      // 담보 1개 <-> 급부 N개
      CoverageType.multipleBenefit => BlocProvider(
          create: (_) => getIt<CreateMultipleBenefitReprCoverageCubit>(),
          child: CreateRepresentCoverageScreen(_coverageType),
        ),
      // 담보 1개 <-> 세부보장 N개
      CoverageType.multipleDetailedCoverage => BlocProvider(
          create: (_) =>
              getIt<CreateMultipleDetailedCoverageReprCoverageCubit>(),
          child: CreateRepresentCoverageScreen(_coverageType),
        )
    };
  }
}
