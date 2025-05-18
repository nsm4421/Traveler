import 'package:copy_with_extension/copy_with_extension.dart';

import '../benefit/benefit.entity.dart';

part 'gurantee.entity.g.dart';

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
