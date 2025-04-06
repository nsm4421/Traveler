import 'package:module/data/datasource/export.dart';
import 'package:module/data/model/export.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

/// T : 댓글 DTO / S : 댓글 Entity
abstract class AbsCommentRepositoryImpl<T extends AbsCommentModel,
        S extends AbsCommentEntity>
    with LoggerMixIn
    implements AbsCommentRepository<S> {
  final AbsRemoteCommentDataSource<T> _remoteCommentDataSource;

  AbsCommentRepositoryImpl(this._remoteCommentDataSource);

  /// DTO -> Entity 변환
  S fromModel(T model);

  @override
  Future<S> createParent(
      {required String refId, required String content}) async {
    return await _remoteCommentDataSource
        .create(refId: refId, content: content)
        .then(fromModel);
  }

  @override
  Future<S> createChild(
      {required String refId,
      required String parentCommentId,
      required String content}) async {
    return await _remoteCommentDataSource
        .create(
            refId: refId, parentCommentId: parentCommentId, content: content)
        .then(fromModel);
  }

  @override
  Future<List<S>> fetchParents(
      {required String refId, DateTime? cursor, int limit = 20}) async {
    return await _remoteCommentDataSource
        .fetchParents(refId: refId, cursor: cursor, limit: limit)
        .then((res) => res.map(fromModel).toList());
  }

  @override
  Future<List<S>> fetchChildren(
      {required String parentCommentId,
      DateTime? cursor,
      int limit = 20}) async {
    return await _remoteCommentDataSource
        .fetchChildren(
            parentCommentId: parentCommentId, cursor: cursor, limit: limit)
        .then((res) => res.map(fromModel).toList());
  }

  @override
  Future<void> softDelete(String commentId) async {
    return await _remoteCommentDataSource.softDelete(commentId);
  }
}
