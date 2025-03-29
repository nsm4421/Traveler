import 'package:module/domain/entity/comment/comment.entity.dart';
import 'package:module/domain/entity/export.dart';

abstract class AbsCommentRepository {
  Future<List<CommentEntity>> fetchParents(
      {required String refId, DateTime? cursor, int limit = 20});

  Future<List<CommentEntity>> fetchChildren(
      {required String parentCommentId, DateTime? cursor, int limit = 20});

  Future<void> createParent(
      {required String refId, required String content});

  Future<void> createChild(
      {required String refId,
      required String parentCommentId,
      required String content});

  Future<void> softDelete(String commentId);
}
