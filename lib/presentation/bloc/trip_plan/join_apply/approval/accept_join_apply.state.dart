part of 'accept_join_apply.cubit.dart';

class JoinApplyApprovalState extends BaseState {
  final bool isAccepted;

  JoinApplyApprovalState(
      {super.status, super.errorMessage, required this.isAccepted});

  @override
  JoinApplyApprovalState copyWith(
      {Status? status, String? errorMessage, bool? isAccepted}) {
    return JoinApplyApprovalState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      isAccepted: isAccepted ?? this.isAccepted,
    );
  }
}
