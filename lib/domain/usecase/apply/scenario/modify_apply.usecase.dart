part of '../usecase.dart';

class ModifyApplyUseCase {
  final ApplyRepository _repository;
  final Logger _logger;

  ModifyApplyUseCase(
      {required ApplyRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call(
      {required String id,
        required String planId,
        required String content}) async {
    try {
      return await _repository
          .modify(id: id, planId: planId, content: content)
          .then((_)=>Right(Success<void>()));
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
