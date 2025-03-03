part of '../usecase.dart';

class DeleteApplyUseCase {
  final ApplyRepository _repository;
  final Logger _logger;

  DeleteApplyUseCase(
      {required ApplyRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<FailureResult, SuccessResult<void>>> call(String id) async {
    try {
      return await _repository.delete(id).then((res) => res.fold(
          (l) => Left(FailureResult.from(l)),
          (r) => Right(SuccessResult<void>.from(r))));
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(FailureResult(message: 'error occurs on use case'));
    }
  }
}
