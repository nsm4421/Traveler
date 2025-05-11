part of 'abs_repr_coverage.entity.dart';

class SingleBenefitReprCoverageEntity extends AbsBaseReprCoverageEntity {
  final BenefitEntity benefit;

  SingleBenefitReprCoverageEntity(
      {required super.id,
      required super.code,
      required super.name,
      required super.category,
      required this.benefit})
      : super(type: CoverageType.singleBenefit);

  @override
  SingleBenefitReprCoverageEntity copyWith(
      {String? code,
      String? name,
      CoverageCategory? category,
      BenefitEntity? benefit}) {
    return SingleBenefitReprCoverageEntity(
      id: id,
      code: code ?? this.code,
      name: name ?? this.name,
      category: category ?? this.category,
      benefit: benefit ?? this.benefit,
    );
  }

  factory SingleBenefitReprCoverageEntity.fromResModel(
      FetchReprCoverageResponseModel model) {
    assert(model.details.length == 1);
    return SingleBenefitReprCoverageEntity(
        id: model.id,
        code: model.code,
        name: model.name,
        category: model.category,
        benefit: BenefitEntity.fromDetailModel(model.details.first));
  }
}
