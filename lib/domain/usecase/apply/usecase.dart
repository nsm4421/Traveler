import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/apply/repository.dart';
import 'package:module/domain/usecase/logger.mixin.dart';
import 'package:module/shared/shared.export.dart';

part 'scenario/create_apply.usecase.dart';

part 'scenario/fetch_apply.usecase.dart';

part 'scenario/modify_apply.usecase.dart';

part 'scenario/delete_apply.usecase.dart';

@lazySingleton
class ApplyUseCase with UseCaseLoggerMixIn {
  final ApplyRepository _repository;

  ApplyUseCase(this._repository);

  CreateApplyUseCase get create =>
      CreateApplyUseCase(repository: _repository, logger: logger);

  FetchApplyUseCase get fetch =>
      FetchApplyUseCase(repository: _repository, logger: logger);

  ModifyApplyUseCase get modify =>
      ModifyApplyUseCase(repository: _repository, logger: logger);

  DeleteApplyUseCase get delete =>
      DeleteApplyUseCase(repository: _repository, logger: logger);
}
