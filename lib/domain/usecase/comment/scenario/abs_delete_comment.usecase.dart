part of '../abs_comment.usecase.dart';

abstract class AbsDeleteCommentUseCase {
  final AbsCommentRepository _repository;
  final Logger _logger;

  AbsDeleteCommentUseCase(
      {required AbsCommentRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call(String commentId) async {
    try {
      return await _repository
          .softDelete(commentId)
          .then((res) => const Success<void>())
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
