import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

part 'scenario/create.usecase.dart';

part 'scenario/modify.usecase.dart';

part 'scenario/delete.usecase.dart';

@lazySingleton
class TripPlanUseCase with LoggerMixIn {
  final TripPlanRepository _repository;

  TripPlanUseCase(this._repository);

  CreateTripPlanUseCase get create =>
      CreateTripPlanUseCase(repository: _repository, logger: logger);

  ModifyTripPlanUseCase get modify =>
      ModifyTripPlanUseCase(repository: _repository, logger: logger);
}
