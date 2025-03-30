part of 'display_join_apply.bloc.dart';

final class UpdateJoinApplyApprovalEvent extends AbsDisplayEvent {
  final String tripPlanId;
  final bool isAccepted;

  UpdateJoinApplyApprovalEvent({required this.tripPlanId, required this.isAccepted});
}
