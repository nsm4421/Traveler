part of '../usecase.dart';

class CreateApplyUseCase {
  final ApplyRepository _repository;
  final Logger _logger;

  CreateApplyUseCase(
      {required ApplyRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<FailureResult, SuccessResult<void>>> call(
      {required String planId, required String content}) async {
    try {
      return await _repository.create(planId: planId, content: content).then(
          (res) => res.fold((l) => Left(FailureResult.from(l)),
              (r) => Right(SuccessResult<void>.from(r))));
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return Left(FailureResult(message: 'error occurs on use case'));
    }
  }
}
