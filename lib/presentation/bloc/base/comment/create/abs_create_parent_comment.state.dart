part of 'abs_create_parent_comment.cubit.dart';

class AbsCreateParentCommentState<T extends BaseEntity> extends BaseState {
  final T _ref;

  AbsCreateParentCommentState(this._ref, {super.status, super.errorMessage});

  @override
  AbsCreateParentCommentState<T> copyWith({Status? status, String? errorMessage}) {
    return AbsCreateParentCommentState<T>(
      this._ref,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
