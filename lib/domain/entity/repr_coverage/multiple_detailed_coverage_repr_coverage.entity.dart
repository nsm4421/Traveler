part of 'abs_repr_coverage.entity.dart';

class MultipleDetailedCoverageReprCoverageEntity
    extends AbsBaseReprCoverageEntity {
  late final List<DetailedCoverageEntity> detailCoverages;

  MultipleDetailedCoverageReprCoverageEntity(
      {required super.id,
      required super.code,
      required super.name,
      required super.category,
      List<DetailedCoverageEntity>? detailCoverages})
      : super(type: CoverageType.multipleDetailedCoverage) {
    this.detailCoverages = detailCoverages ?? [];
  }

  @override
  MultipleDetailedCoverageReprCoverageEntity copyWith(
      {String? code,
      String? name,
      CoverageCategory? category,
      List<DetailedCoverageEntity>? detailCoverages}) {
    return MultipleDetailedCoverageReprCoverageEntity(
      id: id,
      code: code ?? this.code,
      name: name ?? this.name,
      category: category ?? this.category,
      detailCoverages: detailCoverages ?? this.detailCoverages,
    );
  }

  factory MultipleDetailedCoverageReprCoverageEntity.fromResModel(
      FetchReprCoverageResponseModel model) {
    assert(model.details.length == 1);
    return MultipleDetailedCoverageReprCoverageEntity(
        id: model.id,
        code: model.code,
        name: model.name,
        category: model.category,
        detailCoverages:
            model.details.map(DetailedCoverageEntity.fromDetailModel).toList());
  }
}
