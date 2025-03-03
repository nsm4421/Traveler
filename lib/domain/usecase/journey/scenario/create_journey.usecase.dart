part of '../usecase.dart';

class CreateJourneyUseCase {
  final JourneyRepository _repository;
  final Logger _logger;

  CreateJourneyUseCase(
      {required JourneyRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<FailureResult, SuccessResult<void>>> call({
    required String content,
    required Country country,
    required DateTimeRange dateTimeRange,
  }) async {
    try {
      return await _repository
          .create(
              content: content, country: country, dateTimeRange: dateTimeRange)
          .then((res) => res.fold((l) => Left(FailureResult.from(l)),
              (r) => Right(SuccessResult<void>.from(r))));
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(FailureResult(message: 'error occurs on use case'));
    }
  }
}
