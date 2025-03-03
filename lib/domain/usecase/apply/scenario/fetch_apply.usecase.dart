part of '../usecase.dart';

class FetchApplyUseCase {
  final ApplyRepository _repository;
  final Logger _logger;

  FetchApplyUseCase(
      {required ApplyRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<FailureResult, SuccessResult<List<ApplyEntity>>>> call(
      {required String planId, required String content}) async {
    try {
      return await _repository.fetch().then((res) => res.fold(
          (l) => Left(FailureResult.from(l)),
          (r) => Right(SuccessResult<List<ApplyEntity>>.from(r))));
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(FailureResult(message: 'error occurs on use case'));
    }
  }
}
