import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../base_state.dart';

part 'abs_create_child_comment.state.dart';

abstract class AbsCreateChildCommentCubit<T extends AbsCommentEntity>
    extends Cubit<AbsCreateChildCommentState<T>> {
  final T _parentComment;

  AbsCommentEntity get parent => _parentComment;

  AbsCreateChildCommentCubit(this._parentComment)
      : super(AbsCreateChildCommentState<T>(_parentComment));

  void updateState({Status? status, String? errorMessage}) {
    emit(state.copyWith(status: status, errorMessage: errorMessage));
  }

  Future<void> create(String content);
}
