import 'package:injectable/injectable.dart';
import 'package:module/data/datasource/remote/database/benefit/benefit.datasource_impl.dart';
import 'package:module/data/model/benefit/req_create_benefit.model.dart';

import 'package:module/domain/repository/benefit.repository.dart';
import 'package:module/shared/export.dart';

import '../../domain/entity/benefit/benefit.entity.dart';

@LazySingleton(as: BenefitRepository)
class BenefitRepositoryImpl with LoggerMixIn implements BenefitRepository {
  final BenefitDataSource _benefitDataSource;

  BenefitRepositoryImpl(this._benefitDataSource);

  @override
  Future<void> create(
      {String? riskUnitCode,
      required BenefitCategory category,
      required String name}) async {
    return await _benefitDataSource.create(CreateBenefitRequestModel(
        risk_unit_code: riskUnitCode, category: category.value, name: name));
  }

  @override
  Future<List<BenefitEntity>> fetchAll() async {
    return await _benefitDataSource
        .fetchAll()
        .then((res) => res.map(BenefitEntity.fromResModel).toList());
  }
}
