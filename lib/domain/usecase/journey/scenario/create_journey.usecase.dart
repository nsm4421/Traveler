part of '../usecase.dart';

class CreateJourneyUseCase {
  final JourneyRepository _repository;
  final Logger _logger;

  CreateJourneyUseCase(
      {required JourneyRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call({
    required String content,
    required Country country,
    required DateTimeRange dateTimeRange,
  }) async {
    try {
      return await _repository
          .create(
          content: content, country: country, dateTimeRange: dateTimeRange)
          .then((_)=>Right(Success<void>()));
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
