import 'package:module/shared/export.dart';
import 'package:module/data/model/benefit/res_fetch_benefit.model.dart';
import '../../../data/model/repr_coverage/res_fetch_repr_coverage.model.dart';
import '../base.entity.dart';

/// 급부
class BenefitEntity extends BaseEntity {
  final String name; // 급부명
  final BenefitCategory category; // 급부분류
  final String? riskUnitCode; // 위험단위코드

  BenefitEntity(
      {super.id,
      super.createdAt,
      super.updatedAt,
      super.removedAt,
      super.createdBy,
      super.updatedBy,
      this.name = '',
      this.category = BenefitCategory.injure,
      this.riskUnitCode});

  @override
  BenefitEntity copyWith(
      {String? name, BenefitCategory? category, String? riskUnitCode}) {
    return BenefitEntity(
        name: name ?? this.name,
        category: category ?? this.category,
        riskUnitCode: riskUnitCode ?? this.riskUnitCode);
  }

  factory BenefitEntity.fromResModel(FetchBenefitResponseModel model) {
    return BenefitEntity(
        id: model.id,
        createdAt: DateTime.tryParse(model.created_at ?? ''),
        updatedAt: DateTime.tryParse(model.updated_at ?? ''),
        removedAt: DateTime.tryParse(model.removed_at ?? ''),
        createdBy: model.created_by,
        updatedBy: model.updated_by,
        name: model.name,
        category: model.category,
        riskUnitCode: model.risk_unit_code);
  }

  factory BenefitEntity.fromDetailModel(ReprCovDetailModel model) {
    return BenefitEntity(
        id: model.benefit_id,
        name: model.benefit_name,
        category: model.benefit_category,
        riskUnitCode: model.risk_unit_code);
  }
}
