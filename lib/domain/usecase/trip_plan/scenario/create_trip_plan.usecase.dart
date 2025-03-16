part of '../trip_plan.usecase.dart';

class CreateTripPlanUseCase {
  final TripPlanRepository _repository;
  final Logger _logger;

  CreateTripPlanUseCase(
      {required TripPlanRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call({
    required String title,
    required String content,
    required Country country,
    required int minHeadCount,
    required int maxHeadCount,
    required List<String> hashtags,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      return await _repository
          .create(
              title: title,
              content: content,
              country: country,
              minHeadCount: minHeadCount,
              maxHeadCount: maxHeadCount,
              hashtags: hashtags,
              startDate: startDate,
              endDate: endDate)
          .then((res) => const Success<void>())
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
