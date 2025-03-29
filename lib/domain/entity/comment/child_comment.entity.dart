part of 'comment.entity.dart';

class ChildCommentEntity extends CommentEntity {
  ChildCommentEntity(
      {required super.id,
      required super.creator,
      required super.refId,
      required super.parentId,
      required super.content,
      super.removedAt});

  factory ChildCommentEntity.fromModel(FetchChildCommentModel model) {
    return ChildCommentEntity(
        id: model.id,
        creator: CreatorEntity.from(model.creator),
        refId: model.ref_id,
        parentId: model.parent_id,
        content: model.removed_at == null ? model.content : "삭제된 댓글입니다",
        removedAt: model.removed_at == null
            ? null
            : DateTime.tryParse(model.removed_at!));
  }

  factory ChildCommentEntity.fromEntity(CommentEntity entity) {
    return ChildCommentEntity(
        id: entity.id,
        creator: entity.creator,
        refId: entity.refId,
        parentId: entity.parentId,
        content: entity.content,
        removedAt: entity.removedAt);
  }
}
