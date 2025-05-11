import 'package:module/domain/entity/detailed_coverage/detail_coverage.entity.dart';
import 'package:module/domain/entity/repr_coverage/abs_repr_coverage.entity.dart';
import 'package:module/shared/export.dart';

import '../entity/benefit/benefit.entity.dart';

abstract interface class ReprCoverageRepository {
  Future<void> createSingleBenefitReprCoverage({
    required String code,
    required String name,
    required CoverageCategory category,
    required BenefitEntity benefit,
  });

  Future<void> createMultiBenefitReprCoverage({
    required String code,
    required String name,
    required CoverageCategory category,
    required List<BenefitEntity> benefits,
  });

  Future<void> createMultiDetailedCoverageReprCoverage({
    required String code,
    required String name,
    required CoverageCategory category,
    required List<DetailedCoverageEntity> detailedCoverages,
  });

  Future<List<AbsReprCoverageEntity>> fetchAll();
}
