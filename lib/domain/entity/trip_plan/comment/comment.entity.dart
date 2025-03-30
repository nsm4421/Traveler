import 'package:module/data/model/export.dart';

import '../../base/abs_comment.entity.dart';
import '../../user/creator.dart';

class TripPlanCommentEntity extends AbsCommentEntity {
  late final List<TripPlanCommentEntity> children;

  TripPlanCommentEntity(
      {required super.id,
      required super.creator,
      required super.refId,
      super.parentCommentId,
      required super.content,
      super.removedAt,
      List<TripPlanCommentEntity>? children}) {
    this.children = children ?? [];
  }

  factory TripPlanCommentEntity.from(TripPlanCommentModel model) {
    return TripPlanCommentEntity(
        id: model.id,
        creator: CreatorEntity.from(model.creator),
        parentCommentId: model.parent_comment_id,
        refId: model.ref_id,
        content: model.removed_at == null ? model.content : "삭제된 댓글입니다",
        removedAt: model.removed_at == null
            ? null
            : DateTime.tryParse(model.removed_at!));
  }

  TripPlanCommentEntity copyWith(
      {List<TripPlanCommentEntity>? children, DateTime? removedAt}) {
    return TripPlanCommentEntity(
      id: this.id,
      creator: this.creator,
      parentCommentId: this.parentCommentId,
      refId: this.refId,
      content: this.content,
      children: children,
      removedAt: removedAt ?? this.removedAt,
    );
  }
}
