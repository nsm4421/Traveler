import 'package:module/domain/entity/base.entity.dart';
import 'package:module/domain/entity/coverage/benefit.entity.dart';
import 'package:module/domain/entity/coverage/detail_coverage.entity.dart';
import 'package:module/shared/export.dart';

/// 대표담보코드 Interface
class BaseReprCoverageEntity extends BaseEntity {
  final CoverageType type;
  final String code;
  final String name;
  late final List<DetailedCoverageEntity> detailedCoverages;
  final CoverageCategory category;

  BaseReprCoverageEntity({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.removedAt,
    this.type = CoverageType.singleBenefit,
    required this.code,
    required this.name,
    List<DetailedCoverageEntity>? detailedCoverages,
    required this.category,
  }) {
    this.detailedCoverages = detailedCoverages ?? [];
  }

  @override
  BaseReprCoverageEntity copyWith(
      {String? code,
      String? name,
      List<DetailedCoverageEntity>? detailedCoverages,
      CoverageCategory? category}) {
    return BaseReprCoverageEntity(
        type: this.type,
        code: code ?? this.code,
        name: name ?? this.name,
        detailedCoverages: detailedCoverages ?? this.detailedCoverages,
        category: category ?? this.category);
  }
}

/// 대표담보코드(급부 1개)
class SimpleBenefitReprCoverageEntity extends BaseReprCoverageEntity {
  final BenefitEntity benefit;

  SimpleBenefitReprCoverageEntity(
      {required super.code,
      required super.name,
      required super.category,
      required this.benefit})
      : super(type: CoverageType.singleBenefit);
}

/// 대표담보코드(급부 N개)
class MultipleBenefitReprCoverageEntity extends BaseReprCoverageEntity {
  late final List<BenefitEntity> benefits;

  MultipleBenefitReprCoverageEntity(
      {required super.code,
      required super.name,
      required super.category,
      List<BenefitEntity>? benefits})
      : super(type: CoverageType.multipleBenefit) {
    this.benefits = benefits ?? [];
  }
}

/// 대표담보코드(세부보장 N개)
class MultipleDetailedCoverageReprCoverageEntity
    extends BaseReprCoverageEntity {
  late final List<DetailedCoverageEntity> detailCoverages;

  MultipleDetailedCoverageReprCoverageEntity(
      {required super.code,
      required super.name,
      required super.category,
      List<DetailedCoverageEntity>? detailCoverages})
      : super(type: CoverageType.multipleDetailedCoverage) {
    this.detailCoverages = detailCoverages ?? [];
  }
}
