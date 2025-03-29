part of 'comment.entity.dart';

class ParentCommentEntity extends CommentEntity {
  late final List<ChildCommentEntity> children;

  ParentCommentEntity(
      {required super.id,
      required super.creator,
      required super.refId,
      required super.content,
      super.removedAt,
      List<ChildCommentEntity>? children}) {
    this.children = children ?? [];
  }

  factory ParentCommentEntity.fromModel(FetchParentCommentModel model) {
    return ParentCommentEntity(
        id: model.id,
        creator: CreatorEntity.from(model.creator),
        refId: model.ref_id,
        content: model.removed_at == null ? model.content : "삭제된 댓글입니다",
        removedAt: model.removed_at == null
            ? null
            : DateTime.tryParse(model.removed_at!));
  }

  factory ParentCommentEntity.fromEntity(CommentEntity entity) {
    return ParentCommentEntity(
        id: entity.id,
        creator: entity.creator,
        refId: entity.refId,
        content: entity.content,
        removedAt: entity.removedAt);
  }

  ParentCommentEntity copyWith(List<ChildCommentEntity>? children) {
    return ParentCommentEntity(
      id: this.id,
      creator: this.creator,
      refId: this.refId,
      content: this.content,
      children: children ?? this.children,
    );
  }
}
