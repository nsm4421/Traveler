part of '../usecase.dart';

class SignOutUseCase {
  final AuthRepository _repository;

  SignOutUseCase(this._repository);

  Future<Either<FailureResult, SuccessResult<void>>> call(
      {required String username, required String password}) async {
    return await _repository.signOut().then((res) => res.fold(
        (l) => Left(FailureResult.from(l)),
        (r) => Right(SuccessResult<void>.from(r))));
  }
}
