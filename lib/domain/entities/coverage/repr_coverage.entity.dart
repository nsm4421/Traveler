import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:karma/shared/shared.export.dart';

import '../gurantee/gurantee.entity.dart';

part 'repr_coverage.entity.g.dart';

/// 대표담보
@CopyWith(copyWithNull: true)
class ReprCoverageEntity {
  final String code; // 대표담보코드
  final String name; // 대표담보명
  final CoverageCategory category; // 대표담보분류
  late final List<GuranteeEntity> gurantees; // 세부보장

  ReprCoverageEntity(
      {required this.code,
      required this.name,
      required this.category,
      List<GuranteeEntity>? gurantees}) {
    this.gurantees = gurantees ?? [];
  }
}
