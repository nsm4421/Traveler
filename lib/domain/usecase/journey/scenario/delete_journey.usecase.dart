part of '../usecase.dart';

class DeleteJourneyUseCase {
  final JourneyRepository _repository;
  final Logger _logger;

  DeleteJourneyUseCase(
      {required JourneyRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call(String id) async {
    try {
      return await _repository.delete(id).then((_) => Right(Success<void>()));
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
