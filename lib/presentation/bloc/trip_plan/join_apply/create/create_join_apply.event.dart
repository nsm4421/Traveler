part of 'create_join_apply.bloc.dart';

final class CreateJoinApplyEvent {}

final class MountJoinApplyEvent extends CreateJoinApplyEvent {}

final class InitJoinApplyEvent extends CreateJoinApplyEvent {
  final Status? status;
  final String? errorMessage;
  final ApplyStatus? applyStatus;

  InitJoinApplyEvent({this.status, this.errorMessage, this.applyStatus});
}

final class SubmitJoinApplyEvent extends CreateJoinApplyEvent {
  final String content;

  SubmitJoinApplyEvent(this.content);
}
