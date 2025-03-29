import 'package:module/data/datasource/export.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

abstract class AbsCommentRepositoryImpl
    with LoggerMixIn
    implements AbsCommentRepository {
  final AbsRemoteCommentDataSource _remoteCommentDataSource;

  AbsCommentRepositoryImpl(this._remoteCommentDataSource);

  @override
  Future<void> createChild(
      {required String refId,
      required String parentCommentId,
      required String content}) async {
    return await _remoteCommentDataSource.createChild(
        refId: refId, parentId: parentCommentId, content: content);
  }

  @override
  Future<void> createParent(
      {required String refId, required String content}) async {
    return await _remoteCommentDataSource.createParent(
        refId: refId, content: content);
  }

  @override
  Future<void> softDelete(String commentId) async {
    return await _remoteCommentDataSource.softDelete(commentId);
  }

  @override
  Future<List<ChildCommentEntity>> fetchChildren(
      {required String parentCommentId,
      DateTime? cursor,
      int limit = 20}) async {
    return await _remoteCommentDataSource
        .fetchChildren(
            parentCommentId: parentCommentId, cursor: cursor, limit: limit)
        .then((res) => res.map(ChildCommentEntity.fromModel).toList());
  }

  @override
  Future<List<ParentCommentEntity>> fetchParents(
      {required String refId, DateTime? cursor, int limit = 20}) async {
    return await _remoteCommentDataSource
        .fetchParents(refId: refId, cursor: cursor, limit: limit)
        .then((res) => res.map(ParentCommentEntity.fromModel).toList());
  }
}
