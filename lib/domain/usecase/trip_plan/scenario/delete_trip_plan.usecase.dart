part of '../trip_plan.usecase.dart';

class DeleteTripPlanUseCase {
  final TripPlanRepository _repository;
  final Logger _logger;

  DeleteTripPlanUseCase(
      {required TripPlanRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call(String id) async {
    try {
      return await _repository
          .delete(id)
          .then((res) => const Success<void>())
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
