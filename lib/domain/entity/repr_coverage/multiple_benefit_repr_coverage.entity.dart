part of 'abs_repr_coverage.entity.dart';

class MultipleBenefitReprCoverageEntity extends AbsBaseReprCoverageEntity {
  late final List<BenefitEntity> benefits;

  MultipleBenefitReprCoverageEntity(
      {required super.id,
      required super.code,
      required super.name,
      required super.category,
      List<BenefitEntity>? benefits})
      : super(type: CoverageType.multipleBenefit) {
    this.benefits = benefits ?? [];
  }

  @override
  MultipleBenefitReprCoverageEntity copyWith(
      {String? code,
      String? name,
      CoverageCategory? category,
      List<BenefitEntity>? benefits}) {
    return MultipleBenefitReprCoverageEntity(
      id: id,
      code: code ?? this.code,
      name: name ?? this.name,
      category: category ?? this.category,
      benefits: benefits ?? this.benefits,
    );
  }

  factory MultipleBenefitReprCoverageEntity.fromResModel(
      FetchReprCoverageResponseModel model) {
    assert(model.details.length == 1);
    return MultipleBenefitReprCoverageEntity(
        id: model.id,
        code: model.code,
        name: model.name,
        category: model.category,
        benefits: model.details.map(BenefitEntity.fromDetailModel).toList());
  }
}
