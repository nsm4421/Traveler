part of 'add_coverage.cubit.dart';

enum AddCoverageStep {
  selectReprCoverage,
  selectProperties,
  filterCoverages,
  save;
}

@CopyWith(copyWithNull: true)
class AddCoverageState extends AbsBlocState {
  final AddCoverageStep step;
  final ReprCoverageEntity? reprCoverage;
  late final List<ProductCoverageEntity> candidates;
  late final List<ProductCoverageEntity> seleted;

  AddCoverageState({
    super.status = Status.initial,
    super.message = '',
    this.reprCoverage,
    this.step = AddCoverageStep.selectReprCoverage,
    List<ProductCoverageEntity>? candidates,
    List<ProductCoverageEntity>? seleted,
  }) {
    this.candidates = candidates ?? [];
    this.seleted = seleted ?? [];
  }
}
