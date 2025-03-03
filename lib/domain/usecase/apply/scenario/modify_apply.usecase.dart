part of '../usecase.dart';

class ModifyApplyUseCase {
  final ApplyRepository _repository;
  final Logger _logger;

  ModifyApplyUseCase(
      {required ApplyRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<FailureResult, SuccessResult<void>>> call(
      {required String id,
      required String planId,
      required String content}) async {
    try {
      return await _repository
          .modify(id: id, planId: planId, content: content)
          .then((res) => res.fold((l) => Left(FailureResult.from(l)),
              (r) => Right(SuccessResult<void>.from(r))));
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(FailureResult(message: 'error occurs on use case'));
    }
  }
}
