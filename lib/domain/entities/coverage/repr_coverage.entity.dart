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

/// 대표담보코드 + 구분자
@CopyWith(copyWithNull: true)
class ReprCoverageWithPropertiesEntity {
  final ReprCoverageEntity reprCoverage; // 대표담보
  final bool isRenewal;
  final bool isSpecialConditioned;
  final bool isConvertable;
  final bool isBeforeBirth;
  final bool isAddCov;

  ReprCoverageWithPropertiesEntity(
      {required this.reprCoverage,
      this.isRenewal = false,
      this.isSpecialConditioned = false,
      this.isConvertable = false,
      this.isBeforeBirth = false,
      this.isAddCov = false});

  String get name {
    var name = reprCoverage.name;
    if (isRenewal) {
      name = '갱신형 ${name}';
    }
    if (isAddCov) {
      name = '${name}(추가)';
    }
    if (isConvertable) {
      name = '${name}(전환용)';
    }
    if (isBeforeBirth) {
      name = '${name}(출생전)';
    }
    if (isSpecialConditioned) {
      name = '[특별조건부]${name}';
    }
    return name;
  }

  bool eq(ReprCoverageWithPropertiesEntity other) =>
      (reprCoverage.code == other.reprCoverage.code) &&
      (isRenewal == other.isRenewal) &&
      (isAddCov == other.isAddCov) &&
      (isConvertable == other.isConvertable) &&
      (isBeforeBirth == other.isBeforeBirth) &&
      (isSpecialConditioned == other.isSpecialConditioned);

  bool isIn(List<ReprCoverageWithPropertiesEntity> iter) {
    for (final e in iter) {
      if (e.eq(this)) {
        return true;
      }
    }
    return false;
  }
}
