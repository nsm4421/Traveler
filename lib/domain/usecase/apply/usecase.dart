import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/apply/repository.dart';
import 'package:module/shared/shared.export.dart';

part 'scenario/create_apply.usecase.dart';

part 'scenario/fetch_apply.usecase.dart';

part 'scenario/modify_apply.usecase.dart';

part 'scenario/delete_apply.usecase.dart';

@lazySingleton
class ApplyUseCase {
  final ApplyRepository _repository;

  ApplyUseCase(this._repository);

  CreateApplyUseCase get create => CreateApplyUseCase(_repository);

  FetchApplyUseCase get fetch => FetchApplyUseCase(_repository);

  ModifyApplyUseCase get modify => ModifyApplyUseCase(_repository);

  DeleteApplyUseCase get delete => DeleteApplyUseCase(_repository);
}
