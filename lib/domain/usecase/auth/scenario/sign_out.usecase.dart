part of '../auth.usecase.dart';

class SignOutUseCase {
  final AuthRepository _repository;
  final Logger _logger;

  SignOutUseCase({required AuthRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call() async {
    try {
      return await _repository
          .signOut()
          .then((_) => const Right(Success<void>()));
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
