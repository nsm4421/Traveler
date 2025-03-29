import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../base_state.dart';

part 'create_child_comment.state.dart';

class CreateChildCommentCubit<T extends BaseEntity>
    extends Cubit<CreateChildCommentState> {
  final AbsCommentUseCase _useCase;
  final Logger _logger;
  final T _ref;
  final ParentCommentEntity _parentComment;

  ParentCommentEntity get parent => _parentComment;

  CreateChildCommentCubit(
      {required ParentCommentEntity parentComment,
      required T ref,
      required AbsCommentUseCase useCase,
      required Logger logger})
      : _parentComment = parentComment,
        _ref = ref,
        _useCase = useCase,
        _logger = logger,
        super(CreateChildCommentState(parentComment));

  Future<void> create(String content) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await _useCase.createChildComment
          .call(
              refId: _ref.id,
              parentCommentId: _parentComment.id,
              content: content)
          .then((res) => res.fold(
              (l) => emit(state.copyWith(
                  status: Status.error, errorMessage: l.message)),
              (r) => emit(
                  state.copyWith(status: Status.success, errorMessage: ''))));
    } catch (error) {
      _logger.e([LogTags.bloc, error]);
      emit(state.copyWith(status: Status.error, errorMessage: 'error occurs'));
    } finally {
      if (state.status == Status.loading) {
        emit(state.copyWith(status: Status.initial));
      }
    }
  }
}
