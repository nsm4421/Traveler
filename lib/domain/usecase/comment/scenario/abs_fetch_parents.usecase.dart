part of '../abs_comment.usecase.dart';

abstract class AbsFetchParentCommentsUseCase {
  final AbsCommentRepository _repository;
  final Logger _logger;

  AbsFetchParentCommentsUseCase(
      {required AbsCommentRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<List<ParentCommentEntity>>>> call(
      {required String refId, DateTime? cursor, int limit = 20}) async {
    try {
      return await _repository
          .fetchParents(refId: refId, cursor: cursor, limit: limit)
          .then((res) => res.map(ParentCommentEntity.fromEntity).toList())
          .then((res) => Success<List<ParentCommentEntity>>(data: res))
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
