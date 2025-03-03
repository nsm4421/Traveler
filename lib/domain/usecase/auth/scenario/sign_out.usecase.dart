part of '../usecase.dart';

class SignOutUseCase {
  final AuthRepository _repository;
  final Logger _logger;

  SignOutUseCase({required AuthRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<FailureResult, SuccessResult<void>>> call(
      {required String username, required String password}) async {
    try {
      return await _repository.signOut().then((res) => res.fold(
          (l) => Left(FailureResult.from(l)),
          (r) => Right(SuccessResult<void>.from(r))));
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(FailureResult(message: 'error occurs on use case'));
    }
  }
}
