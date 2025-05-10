import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:module/domain/entity/coverage/benefit.entity.dart';
import 'package:module/domain/entity/coverage/detail-coverage.entity.dart';
import 'package:module/presentation/bloc/state.dart';
import 'package:module/shared/export.dart';

part 'create-repr-coverage.state.dart';

abstract class BaseCreateReprCoverageCubit<
    T extends BaseCreateReprCoverageState> extends Cubit<T> {
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
  CreateSingleBenefitReprCoverageCubit()
      : super(CreateSingleBenefitReprCoverageState());

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
  CreateMultipleBenefitReprCoverageCubit()
      : super(CreateMultipleBenefitReprCoverageState());

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
  CreateMultipleDetailedCoverageReprCoverageCubit()
      : super(CreateMultipleDetailedCoverageReprCoverageState());

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
