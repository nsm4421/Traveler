part of '../usecase.dart';

class SignInUseCase {
  final AuthRepository _repository;

  SignInUseCase(this._repository);

  Future<Either<FailureResult, SuccessResult<UserEntity>>> call(
      {required String username, required String password}) async {
    return await _repository
        .signIn(username: username, password: password)
        .then((res) => res.fold((l) => Left(FailureResult.from(l)),
            (r) => Right(SuccessResult<UserEntity>.from(r))));
  }
}
