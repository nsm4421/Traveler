import 'package:module/domain/entity/base.entity.dart';
import 'package:module/domain/entity/coverage/benefit.entity.dart';

/// 세부보장
class DetailedCoverageEntity extends BaseEntity {
  final int seq; // 세부보장 순번
  final String name; // 세부보장명
  final BenefitEntity benefit; // 급부

  DetailedCoverageEntity(
      {super.id,
      super.createdAt,
      super.updatedAt,
      super.removedAt,
      this.name = '',
      this.seq = 1,
      required this.benefit});

  @override
  DetailedCoverageEntity copyWith({
    String? name,
    int? seq,
    BenefitEntity? benefit,
  }) {
    return DetailedCoverageEntity(
        name: name ?? this.name,
        seq: seq ?? this.seq,
        benefit: benefit ?? this.benefit);
  }
}
