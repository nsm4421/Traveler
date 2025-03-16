part of 'create_join_apply.cubit.dart';

class CreateJoinApplyState extends BaseState {
  final String content;

  CreateJoinApplyState({super.status, super.errorMessage, this.content = ''});

  CreateJoinApplyState copyWith(
      {Status? status, String? errorMessage, String? content}) {
    return CreateJoinApplyState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        content: content ?? this.content);
  }
}
