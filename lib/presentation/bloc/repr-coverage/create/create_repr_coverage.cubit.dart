import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:module/domain/entity/benefit/benefit.entity.dart';
import 'package:module/domain/entity/detailed_coverage/detail_coverage.entity.dart';
import 'package:module/domain/usecase/repr_coverage/repr_coverage.usecase.dart';
import 'package:module/presentation/bloc/state.dart';
import 'package:module/shared/export.dart';

part 'create_repr_coverage.state.dart';

abstract class BaseCreateReprCoverageCubit<T extends AbsCreateReprCoverageState>
    extends Cubit<T> {
  BaseCreateReprCoverageCubit(super.initialState);

  CoverageType get coverageType;

  void updateState({
    Status? status,
    String? message,
    String? name,
    CoverageCategory? category,
  });

  Future<void> submit();
}

@injectable
class CreateSingleBenefitReprCoverageCubit
    extends BaseCreateReprCoverageCubit<CreateSingleBenefitReprCoverageState> {
  CreateSingleBenefitReprCoverageCubit(this._useCase)
      : super(CreateSingleBenefitReprCoverageState());

  final ReprCoverageUseCase _useCase;

  @override
  CoverageType get coverageType => CoverageType.singleBenefit;

  @override
  Future<void> submit() async {
    // TODO: implement submit
    throw UnimplementedError();
  }

  @override
  void updateState(
      {Status? status,
      String? message,
      String? name,
      CoverageCategory? category,
      BenefitEntity? benefit}) {
    emit(state.copyWith(
      status: status ?? state.status,
      message: message ?? state.message,
      name: name ?? state.name,
      category: category ?? state.category,
      benefit: benefit ?? state.benefit,
    ));
  }
}

@injectable
class CreateMultipleBenefitReprCoverageCubit
    extends BaseCreateReprCoverageCubit<
        CreateMultipleBenefitReprCoverageState> {
  CreateMultipleBenefitReprCoverageCubit(this._useCase)
      : super(CreateMultipleBenefitReprCoverageState());

  final ReprCoverageUseCase _useCase;

  @override
  CoverageType get coverageType => CoverageType.multipleBenefit;

  @override
  Future<void> submit() async {
    // TODO: implement submit
    throw UnimplementedError();
  }

  @override
  void updateState(
      {Status? status,
      String? message,
      String? name,
      CoverageCategory? category,
      List<BenefitEntity>? benefits}) {
    emit(state.copyWith(
      status: status ?? state.status,
      message: message ?? state.message,
      name: name ?? state.name,
      category: category ?? state.category,
      benefits: benefits ?? state.benefits,
    ));
  }
}

@injectable
class CreateMultipleDetailedCoverageReprCoverageCubit
    extends BaseCreateReprCoverageCubit<
        CreateMultipleDetailedCoverageReprCoverageState> {
  CreateMultipleDetailedCoverageReprCoverageCubit(this._useCase)
      : super(CreateMultipleDetailedCoverageReprCoverageState());

  final ReprCoverageUseCase _useCase;

  @override
  CoverageType get coverageType => CoverageType.multipleDetailedCoverage;

  @override
  Future<void> submit() async {
    // TODO: implement submit
    throw UnimplementedError();
  }

  @override
  void updateState({
    Status? status,
    String? message,
    String? name,
    CoverageCategory? category,
    List<DetailedCoverageEntity>? detailedCoverages,
  }) {
    emit(state.copyWith(
      status: status ?? state.status,
      message: message ?? state.message,
      name: name ?? state.name,
      category: category ?? state.category,
      detailedCoverages: detailedCoverages ?? state.detailedCoverages,
    ));
  }
}
