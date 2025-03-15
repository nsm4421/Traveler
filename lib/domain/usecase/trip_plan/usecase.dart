import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../entity/trip_plan/entity.dart';

part 'scenario/create.usecase.dart';

part 'scenario/modify.usecase.dart';

part 'scenario/delete.usecase.dart';

part 'scenario/fetch.usecase.dart';

@lazySingleton
class TripPlanUseCase with LoggerMixIn {
  final TripPlanRepository _repository;

  TripPlanUseCase(this._repository);

  FetchTripPlanUseCase get fetch =>
      FetchTripPlanUseCase(repository: _repository, logger: logger);

  CreateTripPlanUseCase get create =>
      CreateTripPlanUseCase(repository: _repository, logger: logger);

  ModifyTripPlanUseCase get modify =>
      ModifyTripPlanUseCase(repository: _repository, logger: logger);
}
