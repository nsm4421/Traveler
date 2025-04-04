part of '../../trip_plan.usecase.dart';

class DeleteJoinApplyUseCase {
  final JoinApplyRepository _repository;
  final Logger _logger;

  DeleteJoinApplyUseCase(
      {required JoinApplyRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call(String id) async {
    try {
      return await _repository
          .delete(id)
          .then((_) => const Success<void>())
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
