import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

part 'scenario/create_journey.usecase.dart';

part 'scenario/fetch_journey.usecase.dart';

part 'scenario/modify_journey.usecase.dart';

part 'scenario/delete_journey.usecase.dart';

@lazySingleton
class JourneyUseCase with LoggerMixIn {
  final JourneyRepository _repository;

  JourneyUseCase(this._repository);

  CreateJourneyUseCase get create =>
      CreateJourneyUseCase(repository: _repository, logger: logger);

  FetchJourneyUseCase get fetch =>
      FetchJourneyUseCase(repository: _repository, logger: logger);

  ModifyJourneyUseCase get modify =>
      ModifyJourneyUseCase(repository: _repository, logger: logger);

  DeleteJourneyUseCase get delete =>
      DeleteJourneyUseCase(repository: _repository, logger: logger);
}
