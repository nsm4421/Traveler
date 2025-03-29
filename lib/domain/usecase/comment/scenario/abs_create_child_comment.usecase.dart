part of '../abs_comment.usecase.dart';

abstract class AbsCreateChildCommentUseCase {
  final AbsCommentRepository _repository;
  final Logger _logger;

  AbsCreateChildCommentUseCase(
      {required AbsCommentRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call({
    required String refId,
    required String parentCommentId,
    required String content,
  }) async {
    try {
      return await _repository
          .createChild(
              refId: refId, parentCommentId: parentCommentId, content: content)
          .then((res) => const Success<void>())
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
