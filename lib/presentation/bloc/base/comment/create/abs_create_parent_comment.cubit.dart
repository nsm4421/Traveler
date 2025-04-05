import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module/domain/entity/base/base.entity.dart';
import 'package:module/presentation/bloc/base/base_state.dart';
import 'package:module/shared/shared.export.dart';

part 'abs_create_parent_comment.state.dart';

abstract class AbsCreateParentCommentCubit<T extends BaseEntity>
    extends Cubit<AbsCreateParentCommentState<T>> {
  final T _ref;

  T get ref => _ref;

  AbsCreateParentCommentCubit(T this._ref) : super(AbsCreateParentCommentState<T>(_ref));

  void updateState({Status? status, String? errorMessage}) {
    emit(state.copyWith(status: status, errorMessage: errorMessage));
  }

  Future<void> create(String content);
}
