part of 'edit_repr_coverage.cubit.dart';

@CopyWith()
class EditReprCoverageState extends AbsBlocState {
  final String name; // 담보명
  final CoverageCategory category; // 담보유형
  late List<GuranteeEntity> gurantees;

  EditReprCoverageState({
    super.status = Status.initial,
    super.message = '',
    this.name = '',
    this.category = CoverageCategory.injure,
    List<GuranteeEntity>? gurantees,
  }) {
    this.gurantees = gurantees ?? [];
  }
}
