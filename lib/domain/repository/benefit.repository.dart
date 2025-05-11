import 'package:module/shared/export.dart';

import '../entity/benefit/benefit.entity.dart';

abstract interface class BenefitRepository {
  Future<void> create({
    String? riskUnitCode,
    required BenefitCategory category,
    required String name,
  });

  Future<List<BenefitEntity>> fetchAll();
}
