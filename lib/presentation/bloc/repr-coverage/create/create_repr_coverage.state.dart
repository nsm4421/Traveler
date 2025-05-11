part of 'create_repr_coverage.cubit.dart';

class BaseCreateReprCoverageState extends BaseState {
  final String name;
  final CoverageCategory category;

  BaseCreateReprCoverageState({
    super.status,
    super.message,
    this.name = '',
    this.category = CoverageCategory.injure,
  });

  @override
  BaseCreateReprCoverageState copyWith({
    Status? status,
    String? message,
    String? name,
    CoverageCategory? category,
  }) {
    return BaseCreateReprCoverageState(
      status: status ?? this.status,
      message: message ?? this.message,
      name: name ?? this.name,
      category: category ?? this.category,
    );
  }
}

class CreateSingleBenefitReprCoverageState extends BaseCreateReprCoverageState {
  late final BenefitEntity benefit;

  CreateSingleBenefitReprCoverageState(
      {super.status,
      super.message,
      super.name,
      super.category,
      BenefitEntity? benefit}) {
    this.benefit = benefit ?? BenefitEntity();
  }

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
    extends BaseCreateReprCoverageState {
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
    extends BaseCreateReprCoverageState {
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
