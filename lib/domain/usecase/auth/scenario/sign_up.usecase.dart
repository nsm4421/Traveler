part of '../usecase.dart';

class SignUpUseCase {
  final AuthRepository _repository;

  SignUpUseCase(this._repository);

  // TODO : 프로필 사진 업롣 기능
  Future<Either<FailureResult, SuccessResult<void>>> call(
      {required String username,
      required String description,
      required Sex sex,
      required DateTime bornAt,
      required String password}) async {
    return await _repository
        .signUp(
            username: username,
            description: description,
            sex: sex,
            bornAt: bornAt,
            password: password)
        .then((res) => res.fold((l) => Left(FailureResult.from(l)),
            (r) => Right(SuccessResult<void>.from(r))));
  }
}
