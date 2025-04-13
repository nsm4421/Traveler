import 'package:module/data/model/export.dart';

import '../../base/abs_comment.entity.dart';
import '../../user/creator.entity.dart';

class ReviewCommentEntity extends AbsCommentEntity {
  late final List<ReviewCommentEntity> children;

  ReviewCommentEntity(
      {required super.id,
      required super.creator,
      required super.createdAt,
      required super.refId, // review id
      super.parentCommentId,
      required super.content,
      super.removedAt,
      List<ReviewCommentEntity>? children}) {
    this.children = children ?? [];
  }

  factory ReviewCommentEntity.from(ReviewCommentModel model) {
    return ReviewCommentEntity(
        id: model.id,
        creator: CreatorEntity.from(model.creator),
        createdAt: DateTime.parse(model.created_at),
        parentCommentId: model.parent_comment_id,
        refId: model.ref_id,
        content: model.removed_at == null ? model.content : "삭제된 댓글입니다",
        removedAt: model.removed_at == null
            ? null
            : DateTime.tryParse(model.removed_at!));
  }

  @override
  ReviewCommentEntity copyWith(
      {List<ReviewCommentEntity>? children, DateTime? removedAt}) {
    return ReviewCommentEntity(
      id: this.id,
      creator: this.creator,
      createdAt: this.createdAt,
      parentCommentId: this.parentCommentId,
      refId: this.refId,
      content: this.content,
      children: children,
      removedAt: removedAt ?? this.removedAt,
    );
  }
}
