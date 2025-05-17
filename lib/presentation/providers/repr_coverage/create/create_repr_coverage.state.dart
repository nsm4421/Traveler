part of 'create_repr_coverage.cubit.dart';

@CopyWith()
class CreateReprCoverageState extends AbsBlocState {
  final String name; // 담보명
  final CoverageCategory category; // 담보유형
  late List<GuranteeEntity> gurantees;

  CreateReprCoverageState({
    super.status = Status.initial,
    super.message = '',
    this.name = '',
    this.category = CoverageCategory.injure,
    List<GuranteeEntity>? gurantees,
  }) {
    this.gurantees = gurantees ?? [];
  }
}
