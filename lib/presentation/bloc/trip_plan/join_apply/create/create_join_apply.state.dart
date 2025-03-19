part of 'create_join_apply.bloc.dart';

enum ApplyStatus {
  unMounted,
  appliedBefore,
  alreadyClosed,
  canApply;
}

class CreateJoinApplyState extends BaseState {
  final ApplyStatus applyStatus; // 지원 가능여부

  CreateJoinApplyState({
    this.applyStatus = ApplyStatus.unMounted,
    super.status = Status.initial,
    super.errorMessage = '',
  });

  @override
  CreateJoinApplyState copyWith(
      {ApplyStatus? applyStatus, Status? status, String? errorMessage}) {
    return CreateJoinApplyState(
        applyStatus: applyStatus ?? this.applyStatus,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
