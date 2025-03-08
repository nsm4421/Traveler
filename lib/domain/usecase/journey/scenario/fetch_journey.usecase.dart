part of '../usecase.dart';

class FetchJourneyUseCase {
  final JourneyRepository _repository;
  final Logger _logger;

  FetchJourneyUseCase(
      {required JourneyRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<List<JourneyEntity>>>> call({
    required String content,
    required Country country,
    required DateTimeRange dateTimeRange,
  }) async {
    try {
      return await _repository
          .fetch()
          .then((r) => Right(Success<List<JourneyEntity>>(data:r)));
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
