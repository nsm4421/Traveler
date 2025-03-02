import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

part 'scenario/create_journey.usecase.dart';

part 'scenario/fetch_journey.usecase.dart';

part 'scenario/modify_journey.usecase.dart';

part 'scenario/delete_journey.usecase.dart';

@lazySingleton
class JourneyUseCase {
  final JourneyRepository _repository;

  JourneyUseCase(this._repository);

  CreateJourneyUseCase get create => CreateJourneyUseCase(_repository);

  FetchJourneyUseCase get fetch => FetchJourneyUseCase(_repository);

  ModifyJourneyUseCase get modify => ModifyJourneyUseCase(_repository);

  DeleteJourneyUseCase get delete => DeleteJourneyUseCase(_repository);
}
