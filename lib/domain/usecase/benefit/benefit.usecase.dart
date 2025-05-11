import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:module/domain/entity/benefit/benefit.entity.dart';
import 'package:module/domain/repository/benefit.repository.dart';
import 'package:module/shared/export.dart';

part 'user-scenario/create_benefit.usecase.dart';

part 'user-scenario/fetch_all_benefit.usecase.dart';

@lazySingleton
class BenefitUseCase with LoggerMixIn {
  final BenefitRepository _benefitRepository;

  BenefitUseCase(this._benefitRepository);

  CreateBenefitUseCase get create =>
      CreateBenefitUseCase(repository: _benefitRepository, logger: logger);

  FetchAllBenefitUseCase get fetchAll =>
      FetchAllBenefitUseCase(repository: _benefitRepository, logger: logger);
}
