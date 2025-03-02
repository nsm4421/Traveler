import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

part 'scenario/sign_in.usecase.dart';

part 'scenario/sign_up.usecase.dart';

part 'scenario/sign_out.usecase.dart';

@lazySingleton
class AuthUseCase {
  final AuthRepository _repository;

  AuthUseCase(this._repository);

  UserEntity get currentUser => _repository.currentUser;

  String get currentUid => _repository.currentUid;

  SignUpUseCase get signUp => SignUpUseCase(_repository);

  SignInUseCase get signIn => SignInUseCase(_repository);

  SignOutUseCase get signOut => SignOutUseCase(_repository);
}
