part of '../auth.usecase.dart';

class SignInUseCase {
  final AuthRepository _repository;
  final Logger _logger;

  SignInUseCase({required AuthRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<UserEntity>>> call(
      {required String email, required String password}) async {
    try {
      await _repository
          .signIn(email: email, password: password);
      return Right(Success<UserEntity>(data:_repository.currentUser));
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
