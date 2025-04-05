part of '../../trip_plan.usecase.dart';

class FetchJoinApplyUseCase {
  final JoinApplyRepository _repository;
  final Logger _logger;

  FetchJoinApplyUseCase(
      {required JoinApplyRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<List<JoinApplyEntity>>>> call(
      {required TripPlanEntity tripPlan,
      DateTime? cursor,
      int limit = 20}) async {
    try {
      return await _repository
          .fetch(tripPlanId: tripPlan.id, cursor: cursor, limit: limit)
          // 참가신청 목록 조회 시 여행계획 제안자는 제외
          .then((data) =>
              data.where((apply) => apply.creator.id != tripPlan.creator.id))
          .then((data) => Success<List<JoinApplyEntity>>(data: data.toList()))
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
