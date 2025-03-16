part of '../../trip_plan.usecase.dart';

class CreateJoinApplyUseCase {
  final JoinApplyRepository _repository;
  final Logger _logger;

  CreateJoinApplyUseCase(
      {required JoinApplyRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call(
      {required String tripPlanId, required String content}) async {
    try {
      return await _repository
          .create(tripPlanId: tripPlanId, content: content)
          .then((_) => const Success<void>())
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
