part of 'abs_comment.remote_datasource_impl.dart';

abstract class AbsRemoteCommentDataSource<T extends AbsCommentModel> {
  Future<void> create(
      {required String refId, String? parentCommentId, required String content});

  Future<Iterable<T>> fetchParents(
      {required String refId, DateTime? cursor, int limit = 20});

  Future<Iterable<T>> fetchChildren({
    required String parentCommentId,
    DateTime? cursor,
    int limit = 20,
  });

  Future<void> softDelete(String commentId);
}
