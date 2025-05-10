import 'package:module/domain/entity/base.entity.dart';

/// 급부
class BenefitEntity extends BaseEntity {
  final String code;
  final String name;

  BenefitEntity(
      {super.id,
      super.createdAt,
      super.updatedAt,
      super.removedAt,
      this.code = '',
      this.name = ''});

  @override
  BenefitEntity copyWith({String? code, String? name}) {
    return BenefitEntity(code: code ?? this.code, name: name ?? this.name);
  }
}
