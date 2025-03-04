part of '../usecase.dart';

class SignInUseCase {
  final AuthRepository _repository;
  final Logger _logger;

  SignInUseCase({required AuthRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<FailureResult, SuccessResult<UserEntity>>> call(
      {required String email, required String password}) async {
    try {
      return await _repository
          .signIn(email: email, password: password)
          .then((res) => res.fold((l) => Left(FailureResult.from(l)),
              (r) => Right(SuccessResult<UserEntity>.from(r))));
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(FailureResult(message: 'error occurs on use case'));
    }
  }
}
