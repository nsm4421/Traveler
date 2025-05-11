import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';
import 'package:module/shared/export.dart';

import '../../entity/benefit/benefit.entity.dart';
import '../../entity/detailed_coverage/detail_coverage.entity.dart';
import '../../entity/repr_coverage/abs_repr_coverage.entity.dart';
import '../../repository/repr_coverage.repository.dart';

part 'user-scenario/create_repr_coverage.usecase.dart';

part 'user-scenario/fetch_all_repr_coverage.usecase.dart';

@lazySingleton
class ReprCoverageUseCase with LoggerMixIn {
  final ReprCoverageRepository _reprCoverageRepository;

  ReprCoverageUseCase(this._reprCoverageRepository);

  CreateSingleBenefitReprCoverageUseCase get createSingleBenefit =>
      CreateSingleBenefitReprCoverageUseCase(
          repository: _reprCoverageRepository, logger: logger);

  CreateMultiBenefitReprCoverageUseCase get createMultiBenefit =>
      CreateMultiBenefitReprCoverageUseCase(
          repository: _reprCoverageRepository, logger: logger);

  CreateMultiDetailedCoverageReprCoverageUseCase get createMultiDetailed =>
      CreateMultiDetailedCoverageReprCoverageUseCase(
          repository: _reprCoverageRepository, logger: logger);

  FetchAllReprCoverageUseCase get fetchAll => FetchAllReprCoverageUseCase(
      repository: _reprCoverageRepository, logger: logger);
}
