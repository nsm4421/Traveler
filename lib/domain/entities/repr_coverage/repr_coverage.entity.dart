import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:karma/shared/shared.export.dart';

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

/// 세부보장
@CopyWith(copyWithNull: true)
class GuranteeEntity {
  final String code; // 세부보장코드
  final String? name; // 세부보장명
  late final List<BenefitEntity> benefits; // 급부

  GuranteeEntity({
    this.code = '00',
    this.name,
    List<BenefitEntity>? benefits,
  }) {
    this.benefits = benefits ?? [];
  }
}

/// 세부보장
@CopyWith(copyWithNull: true)
class BenefitEntity {
  final String benefitRiskCode; // 급부위험률
  final String? exitRiskCode; // 급부탈퇴율
  final int seq;

  BenefitEntity({
    this.seq = 0,
    this.benefitRiskCode = '',
    this.exitRiskCode,
  });
}
