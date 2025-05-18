import 'package:copy_with_extension/copy_with_extension.dart';

part 'benefit.entity.g.dart';

/// 급부
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
