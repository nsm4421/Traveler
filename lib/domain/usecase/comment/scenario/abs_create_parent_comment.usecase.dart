part of '../abs_comment.usecase.dart';

abstract class AbsCreateParentCommentUseCase<T extends AbsCommentEntity> {
  final AbsCommentRepository<T> _repository;
  final Logger _logger;

  AbsCreateParentCommentUseCase(
      {required AbsCommentRepository<T> repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<T>>> call(
      {required String refId, required String content}) async {
    try {
      return await _repository
          .createParent(refId: refId, content: content)
          .then((res) => Success<T>(data: res))
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
