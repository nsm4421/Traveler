part of '../abs_comment.usecase.dart';

abstract class AbsFetchChildCommentsUseCase {
  final AbsCommentRepository _repository;
  final Logger _logger;

  AbsFetchChildCommentsUseCase(
      {required AbsCommentRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<List<ChildCommentEntity>>>> call({
    required String parentCommentId,
    DateTime? cursor,
    int limit = 20,
  }) async {
    try {
      return await _repository
          .fetchChildren(
              parentCommentId: parentCommentId, cursor: cursor, limit: limit)
          .then((res) => res.map(ChildCommentEntity.fromEntity).toList())
          .then((res) => Success<List<ChildCommentEntity>>(data: res))
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
