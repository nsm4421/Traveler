part of '../usecase.dart';

class FetchApplyUseCase {
  final ApplyRepository _repository;
  final Logger _logger;

  FetchApplyUseCase(
      {required ApplyRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<List<ApplyEntity>>>> call(
      {required String planId, required String content}) async {
    try {
      return await _repository
          .fetch()
          .then((r) => Right(Success<List<ApplyEntity>>(data: r)));
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
