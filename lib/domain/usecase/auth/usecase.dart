import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

part 'scenario/sign_in.usecase.dart';

part 'scenario/sign_up.usecase.dart';

part 'scenario/sign_out.usecase.dart';

@lazySingleton
class AuthUseCase with LoggerMixIn {
  final AuthRepository _repository;

  AuthUseCase(this._repository);

  UserEntity get currentUser => _repository.currentUser;

  String get currentUid => _repository.currentUid;

  SignUpUseCase get signUp =>
      SignUpUseCase(repository: _repository, logger: logger);

  SignInUseCase get signIn =>
      SignInUseCase(repository: _repository, logger: logger);

  SignOutUseCase get signOut =>
      SignOutUseCase(repository: _repository, logger: logger);
}
