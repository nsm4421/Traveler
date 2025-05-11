part of 'create_repr_coverage.cubit.dart';

abstract class AbsCreateReprCoverageState extends BaseState {
  final String name;
  final CoverageCategory category;

  CoverageType get type;

  AbsCreateReprCoverageState({
    super.status,
    super.message,
    this.name = '',
    this.category = CoverageCategory.injure,
  });
}

class CreateSingleBenefitReprCoverageState extends AbsCreateReprCoverageState {
  late final BenefitEntity benefit;

  CreateSingleBenefitReprCoverageState(
      {super.status,
      super.message,
      super.name,
      super.category,
      BenefitEntity? benefit}) {
    this.benefit = benefit ?? BenefitEntity(name: '');
  }

  @override
  CoverageType get type => CoverageType.singleBenefit;

  @override
  CreateSingleBenefitReprCoverageState copyWith(
      {Status? status,
      String? message,
      String? name,
      CoverageCategory? category,
      BenefitEntity? benefit}) {
    return CreateSingleBenefitReprCoverageState(
        status: status ?? this.status,
        message: message ?? this.message,
        name: name ?? this.name,
        category: category ?? this.category,
        benefit: benefit ?? this.benefit);
  }
}

class CreateMultipleBenefitReprCoverageState
    extends AbsCreateReprCoverageState {
  late final List<BenefitEntity> benefits;

  CreateMultipleBenefitReprCoverageState(
      {super.status,
      super.message,
      super.name,
      super.category,
      List<BenefitEntity>? benefits}) {
    this.benefits = benefits ?? [];
  }

  @override
  CoverageType get type => CoverageType.multipleBenefit;

  @override
  CreateMultipleBenefitReprCoverageState copyWith(
      {Status? status,
      String? message,
      String? name,
      CoverageCategory? category,
      List<BenefitEntity>? benefits}) {
    return CreateMultipleBenefitReprCoverageState(
        status: status ?? this.status,
        message: message ?? this.message,
        name: name ?? this.name,
        category: category ?? this.category,
        benefits: benefits ?? this.benefits);
  }
}

class CreateMultipleDetailedCoverageReprCoverageState
    extends AbsCreateReprCoverageState {
  late final List<DetailedCoverageEntity> detailedCoverages;

  CreateMultipleDetailedCoverageReprCoverageState(
      {super.status,
      super.message,
      super.name,
      super.category,
      List<DetailedCoverageEntity>? detailedCoverages}) {
    this.detailedCoverages = detailedCoverages ?? [];
  }

  @override
  CoverageType get type => CoverageType.multipleDetailedCoverage;

  @override
  CreateMultipleDetailedCoverageReprCoverageState copyWith(
      {Status? status,
      String? message,
      String? name,
      CoverageCategory? category,
      List<DetailedCoverageEntity>? detailedCoverages}) {
    return CreateMultipleDetailedCoverageReprCoverageState(
        status: status ?? this.status,
        message: message ?? this.message,
        name: name ?? this.name,
        category: category ?? this.category,
        detailedCoverages: detailedCoverages ?? this.detailedCoverages);
  }
}
