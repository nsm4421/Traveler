import 'package:module/domain/entity/export.dart';

abstract class AbsCommentRepository<T extends AbsCommentEntity> {
  Future<void> createParent({required String refId, required String content});

  Future<void> createChild(
      {required String refId,
      required String parentCommentId,
      required String content});

  Future<List<T>> fetchParents(
      {required String refId, DateTime? cursor, int limit = 20});

  Future<List<T>> fetchChildren(
      {required String parentCommentId, DateTime? cursor, int limit = 20});

  Future<void> softDelete(String commentId);
}
