part of 'abs_create_parent_comment.cubit.dart';

class CreateParentCommentState<T extends BaseEntity> extends BaseState {
  final T _ref;

  CreateParentCommentState(this._ref, {super.status, super.errorMessage});

  @override
  CreateParentCommentState copyWith({Status? status, String? errorMessage}) {
    return CreateParentCommentState(
      this._ref,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
