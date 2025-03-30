import 'base.entity.dart';

abstract class AbsCommentEntity extends BaseEntity {
  final String refId;
  final String content;
  final DateTime? removedAt;
  final String? parentCommentId;

  AbsCommentEntity({
    required super.id,
    super.createdAt,
    required super.creator,
    required this.refId,
    required this.content,
    this.removedAt,
    this.parentCommentId,
  });
}
