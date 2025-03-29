part of 'create_child_comment.cubit.dart';

class CreateChildCommentState<T extends CommentEntity> extends BaseState {
  final T _parentComment;

  T get parent => _parentComment;

  CreateChildCommentState(this._parentComment,
      {super.status, super.errorMessage});

  @override
  CreateChildCommentState copyWith({Status? status, String? errorMessage}) {
    return CreateChildCommentState(
      this._parentComment,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
