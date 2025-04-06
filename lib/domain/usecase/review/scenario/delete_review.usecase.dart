part of '../review.usecase.dart';

class DeleteReviewUseCase {
  final ReviewRepository _repository;
  final Logger _logger;

  DeleteReviewUseCase(
      {required ReviewRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call(String id) async {
    try {
      return await _repository
          .softDelete(id)
          .then((res) => const Success<void>())
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
