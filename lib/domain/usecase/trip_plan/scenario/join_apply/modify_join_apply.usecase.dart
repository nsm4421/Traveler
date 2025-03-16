part of '../../trip_plan.usecase.dart';

class SwitchIsAcceptedUseCase {
  final JoinApplyRepository _repository;
  final Logger _logger;

  SwitchIsAcceptedUseCase(
      {required JoinApplyRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call(
      {required String id, required bool isAccepted}) async {
    try {
      return await _repository
          .modify(id: id, isAccepted: isAccepted)
          .then((_) => const Success<void>())
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}

class EditJoinApplyContentUseCase {
  final JoinApplyRepository _repository;
  final Logger _logger;

  EditJoinApplyContentUseCase(
      {required JoinApplyRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call(
      {required String id, required String content}) async {
    try {
      return await _repository
          .modify(id: id, content: content)
          .then((_) => const Success<void>())
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
