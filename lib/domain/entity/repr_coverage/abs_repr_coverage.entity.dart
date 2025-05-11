import 'package:module/data/model/repr_coverage/res_fetch_repr_coverage.model.dart';
import 'package:module/shared/export.dart';

import '../base.entity.dart';
import '../benefit/benefit.entity.dart';
import '../detailed_coverage/detail_coverage.entity.dart';

part 'single_benefit_repr_coverage.entity.dart';
part 'multiple_benefit_repr_coverage.entity.dart';
part 'multiple_detailed_coverage_repr_coverage.entity.dart';

/// 대표담보코드
abstract class AbsBaseReprCoverageEntity extends BaseEntity {
  final String code;
  final String name;
  final CoverageType type; // 담보유형(급부1, 급부N, 세부보장N)
  final CoverageCategory category; // 담보분류(상해, 질병, 상해및질병 등)

  AbsBaseReprCoverageEntity({
    required super.id,
    super.createdAt,
    super.updatedAt,
    super.removedAt,
    required this.code,
    required this.name,
    required this.type,
    required this.category,
  });
}
