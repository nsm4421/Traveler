part of 'accept_join_apply.cubit.dart';

class JoinApplyApprovalState extends BaseState {
  final String _tripPlanId;
  final bool isAccepted;

  String get tripPlanId => _tripPlanId;

  JoinApplyApprovalState(
      {super.status,
      super.errorMessage,
      required String tripPlanId,
      required this.isAccepted})
      : _tripPlanId = tripPlanId;

  @override
  JoinApplyApprovalState copyWith(
      {Status? status, String? errorMessage, bool? isAccepted}) {
    return JoinApplyApprovalState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      tripPlanId: _tripPlanId,
      isAccepted: isAccepted ?? this.isAccepted,
    );
  }
}
