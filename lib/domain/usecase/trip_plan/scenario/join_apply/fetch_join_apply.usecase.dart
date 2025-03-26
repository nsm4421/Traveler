part of '../../trip_plan.usecase.dart';

class FetchJoinApplyUseCase {
  final JoinApplyRepository _repository;
  final Logger _logger;

  FetchJoinApplyUseCase(
      {required JoinApplyRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<List<JoinApplyEntity>>>> call(
      {required String tripPlanId, DateTime? cursor, int limit = 20}) async {
    try {
      return await _repository
          .fetch(tripPlanId: tripPlanId, cursor: cursor, limit: limit)
          .then((data) => Success<List<JoinApplyEntity>>(data: data))
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
