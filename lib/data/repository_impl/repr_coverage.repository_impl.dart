import 'package:injectable/injectable.dart';
import 'package:module/data/datasource/remote/database/repr_coverage/repr_coverage.datasource_impl.dart';
import 'package:module/domain/entity/benefit/benefit.entity.dart';
import 'package:module/domain/entity/detailed_coverage/detail_coverage.entity.dart';
import 'package:module/domain/entity/repr_coverage/abs_repr_coverage.entity.dart';
import 'package:module/domain/repository/repr_coverage.repository.dart';
import 'package:module/shared/export.dart';

import '../model/repr_coverage/req_create_repr_coverage.model.dart';

@LazySingleton(as: ReprCoverageRepository)
class ReprCoverageRepositoryImpl
    with LoggerMixIn
    implements ReprCoverageRepository {
  final ReprCoverageDataSource _reprCoverageDataSource;

  ReprCoverageRepositoryImpl(this._reprCoverageDataSource);

  @override
  Future<void> createSingleBenefitReprCoverage({
    required String code,
    required String name,
    required CoverageCategory category,
    required BenefitEntity benefit,
  }) async {
    return await _reprCoverageDataSource.insert([
      CreateReprCoverageRequestModel(
        code: code,
        name: name,
        type: CoverageType.singleBenefit,
        category: category,
        benefit_id: benefit.id,
        seq: 0,
      )
    ]);
  }

  @override
  Future<void> createMultiBenefitReprCoverage({
    required String code,
    required String name,
    required CoverageCategory category,
    required List<BenefitEntity> benefits,
  }) async {
    assert(benefits.length > 1);
    final data = List.generate(
        benefits.length,
        (index) => CreateReprCoverageRequestModel(
            code: code,
            name: name,
            type: CoverageType.multipleDetailedCoverage,
            category: category,
            benefit_id: benefits[index].id,
            seq: index));
    return await _reprCoverageDataSource.insert(data);
  }

  @override
  Future<void> createMultiDetailedCoverageReprCoverage({
    required String code,
    required String name,
    required CoverageCategory category,
    required List<DetailedCoverageEntity> detailedCoverages,
  }) async {
    assert(detailedCoverages.length > 1);
    final data = List.generate(
        detailedCoverages.length,
        (index) => CreateReprCoverageRequestModel(
              code: code,
              name: name,
              type: CoverageType.multipleDetailedCoverage,
              category: category,
              benefit_id: detailedCoverages[index].benefit.id,
              seq: detailedCoverages[index].seq,
              detailed_cov_name: detailedCoverages[index].name,
            ));
    return await _reprCoverageDataSource.insert(data);
  }

  @override
  Future<List<AbsReprCoverageEntity>> fetchAll() async {
    return await _reprCoverageDataSource.fetchAll().then((res) => res
        .map((e) => switch (e.type) {
              CoverageType.singleBenefit =>
                SingleBenefitReprCoverageEntity.fromResModel(e),
              CoverageType.multipleBenefit =>
                MultiBenefitReprCoverageEntity.fromResModel(e),
              CoverageType.multipleDetailedCoverage =>
                MultiDetailedCoverageReprCoverageEntity.fromResModel(e),
            })
        .toList());
  }
}
