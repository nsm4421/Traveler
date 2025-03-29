part of 'display_join_apply.bloc.dart';

final class UpdateJoinApplyApprovalEvent extends DisplayEvent {
  final String tripPlanId;
  final bool isAccepted;

  UpdateJoinApplyApprovalEvent({required this.tripPlanId, required this.isAccepted});
}
