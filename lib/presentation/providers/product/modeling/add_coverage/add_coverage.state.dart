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
  late final List<ReprCoverageWithPropertiesEntity> reprCoverageCandidates;
  late final List<ReprCoverageWithPropertiesEntity> reprCoveragesSelected;
  late final List<ProductCoverageEntity> productCoveragesToAdd;
  final bool renewalChecked;
  final bool specialConditionChecked;
  final bool convertableChecked;
  final bool beforeBirthChecked;
  final bool addCovChecked;

  AddCoverageState({
    super.status = Status.initial,
    super.message = '',
    this.reprCoverage,
    this.step = AddCoverageStep.selectReprCoverage,
    List<ReprCoverageWithPropertiesEntity>? reprCoverageCandidates,
    List<ReprCoverageWithPropertiesEntity>? reprCoveragesSelected,
    List<ProductCoverageEntity>? productCoveragesToAdd,
    this.renewalChecked = false,
    this.specialConditionChecked = false,
    this.convertableChecked = false,
    this.beforeBirthChecked = false,
    this.addCovChecked = false,
  }) {
    this.reprCoverageCandidates = reprCoverageCandidates ?? [];
    this.reprCoveragesSelected = reprCoveragesSelected ?? [];
    this.productCoveragesToAdd = productCoveragesToAdd ?? [];
  }
}
