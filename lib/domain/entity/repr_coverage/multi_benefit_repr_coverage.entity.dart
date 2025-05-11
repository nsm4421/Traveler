part of 'abs_repr_coverage.entity.dart';

class MultiBenefitReprCoverageEntity extends AbsReprCoverageEntity {
  late final List<BenefitEntity> benefits;

  MultiBenefitReprCoverageEntity(
      {required super.id,
      required super.code,
      required super.name,
      required super.category,
      List<BenefitEntity>? benefits})
      : super(type: CoverageType.multipleBenefit) {
    this.benefits = benefits ?? [];
  }

  @override
  MultiBenefitReprCoverageEntity copyWith(
      {String? code,
      String? name,
      CoverageCategory? category,
      List<BenefitEntity>? benefits}) {
    return MultiBenefitReprCoverageEntity(
      id: id,
      code: code ?? this.code,
      name: name ?? this.name,
      category: category ?? this.category,
      benefits: benefits ?? this.benefits,
    );
  }

  factory MultiBenefitReprCoverageEntity.fromResModel(
      FetchReprCoverageResponseModel model) {
    assert(model.details.length == 1);
    return MultiBenefitReprCoverageEntity(
        id: model.id,
        code: model.code,
        name: model.name,
        category: model.category,
        benefits: model.details.map(BenefitEntity.fromDetailModel).toList());
  }
}
