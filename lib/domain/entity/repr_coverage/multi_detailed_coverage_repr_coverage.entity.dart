part of 'abs_repr_coverage.entity.dart';

class MultiDetailedCoverageReprCoverageEntity extends AbsReprCoverageEntity {
  late final List<DetailedCoverageEntity> detailCoverages;

  MultiDetailedCoverageReprCoverageEntity(
      {required super.id,
      required super.code,
      required super.name,
      required super.category,
      List<DetailedCoverageEntity>? detailCoverages})
      : super(type: CoverageType.multipleDetailedCoverage) {
    this.detailCoverages = detailCoverages ?? [];
  }

  @override
  MultiDetailedCoverageReprCoverageEntity copyWith(
      {String? code,
      String? name,
      CoverageCategory? category,
      List<DetailedCoverageEntity>? detailCoverages}) {
    return MultiDetailedCoverageReprCoverageEntity(
      id: id,
      code: code ?? this.code,
      name: name ?? this.name,
      category: category ?? this.category,
      detailCoverages: detailCoverages ?? this.detailCoverages,
    );
  }

  factory MultiDetailedCoverageReprCoverageEntity.fromResModel(
      FetchReprCoverageResponseModel model) {
    assert(model.details.length == 1);
    return MultiDetailedCoverageReprCoverageEntity(
        id: model.id,
        code: model.code,
        name: model.name,
        category: model.category,
        detailCoverages:
            model.details.map(DetailedCoverageEntity.fromDetailModel).toList());
  }
}
