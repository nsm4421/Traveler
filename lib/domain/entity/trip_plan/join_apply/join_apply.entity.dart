import 'package:module/data/model/export.dart';

import '../../base/base.entity.dart';
import '../../user/creator.entity.dart';

class JoinApplyEntity extends BaseEntity {
  final String tripPlanId;
  final String content;
  final bool isAccepted;

  JoinApplyEntity(
      {required super.id,
      super.createdAt,
      required super.creator,
      required this.tripPlanId,
      this.content = '',
      this.isAccepted = false});

  factory JoinApplyEntity.from(FetchJoinApplyModel model) {
    return JoinApplyEntity(
      id: model.id,
      createdAt: DateTime.tryParse(model.created_at),
      creator: CreatorEntity.from(model.creator),
      tripPlanId: model.trip_plan_id,
      content: model.content,
      isAccepted: model.is_accepted,
    );
  }

  JoinApplyEntity copyWith({String? content, bool? isAccepted}) {
    return JoinApplyEntity(
        id: id,
        creator: creator,
        tripPlanId: tripPlanId,
        content: content ?? this.content,
        isAccepted: isAccepted ?? this.isAccepted);
  }
}
