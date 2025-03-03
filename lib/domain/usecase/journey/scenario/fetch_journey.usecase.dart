part of '../usecase.dart';

class FetchJourneyUseCase {
  final JourneyRepository _repository;
  final Logger _logger;

  FetchJourneyUseCase(
      {required JourneyRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<FailureResult, SuccessResult<List<JourneyEntity>>>> call({
    required String content,
    required Country country,
    required DateTimeRange dateTimeRange,
  }) async {
    try {
      return await _repository.fetch().then((res) => res.fold(
          (l) => Left(FailureResult.from(l)),
          (r) => Right(SuccessResult<List<JourneyEntity>>.from(r))));
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(FailureResult(message: 'error occurs on use case'));
    }
  }
}
