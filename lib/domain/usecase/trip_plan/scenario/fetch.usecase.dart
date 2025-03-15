part of '../usecase.dart';

class FetchTripPlanUseCase {
  final TripPlanRepository _repository;
  final Logger _logger;

  FetchTripPlanUseCase(
      {required TripPlanRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<List<TripPlanEntity>>>> call(
      {String? uid, int limit = 20}) async {
    try {
      return await _repository
          .fetch(uid: uid, limit: limit)
          .then((res) => Success<List<TripPlanEntity>>(data: res))
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
