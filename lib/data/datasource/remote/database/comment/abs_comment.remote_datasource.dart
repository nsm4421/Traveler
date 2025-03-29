part of 'abs_comment.remote_datasource_impl.dart';

abstract mixin class AbsRemoteParentCommentDataSource {
  Future<void> createParent({required String refId, required String content});

  Future<Iterable<FetchParentCommentModel>> fetchParents(
      {required String refId, DateTime? cursor, int limit = 20});
}

abstract mixin class AbsRemoteChildCommentDataSource {
  Future<void> createChild(
      {required String refId,
      required String parentId,
      required String content});

  Future<Iterable<FetchChildCommentModel>> fetchChildren(
      {required String parentCommentId, DateTime? cursor, int limit = 20});
}

abstract class AbsRemoteCommentDataSource
    with AbsRemoteParentCommentDataSource, AbsRemoteChildCommentDataSource {
  Future<void> softDelete(String commentId);
}
