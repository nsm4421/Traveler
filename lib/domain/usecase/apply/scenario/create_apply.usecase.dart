part of '../usecase.dart';

class CreateApplyUseCase {
  final ApplyRepository _repository;
  final Logger _logger;

  CreateApplyUseCase(
      {required ApplyRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call(
      {required String planId, required String content}) async {
    try {
      return await _repository
          .create(planId: planId, content: content)
          .then((_)=>Right(Success<void>()));
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return Left(Failure(message: 'error occurs on use case'));
    }
  }
}
