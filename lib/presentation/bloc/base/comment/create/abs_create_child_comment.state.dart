part of 'abs_create_child_comment.cubit.dart';

class AbsCreateChildCommentState<T extends AbsCommentEntity> extends BaseState {
  final T _parentComment;

  T get parent => _parentComment;

  AbsCreateChildCommentState(this._parentComment,
      {super.status, super.errorMessage});

  @override
  AbsCreateChildCommentState copyWith({Status? status, String? errorMessage}) {
    return AbsCreateChildCommentState(
      this._parentComment,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
