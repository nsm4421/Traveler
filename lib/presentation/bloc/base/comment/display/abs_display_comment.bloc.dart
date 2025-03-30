import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:module/domain/entity/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../../base/display/abs_display.bloc.dart';

part 'abs_display_comment_event.dart';

/// 댓글 조회 Bloc
/// T : 댓글 generic
abstract class $AbsDisplayCommentBloc<T extends AbsCommentEntity>
    extends AbsDisplayBloc<T> {
  $AbsDisplayCommentBloc() {
    on<WriteNewCommentEvent<T>>(onWriteNewComment);
  }

  // 신규댓글을 작성한 경우
  Future<void> onWriteNewComment(
      WriteNewCommentEvent<T> event, Emitter<AbsDisplayState<T>> emit) async {
    try {
      emit(state.copyWith(data: [event.newComment, ...state.data]));
    } catch (error) {
      logger.e([LogTags.bloc, error]);
      emit(state.copyWith(
          status: Status.error, errorMessage: 'fail updating new comment'));
    }
  }

  @override
  Future<void> onFetch(FetchDisplayEvent event, Emitter<AbsDisplayState<T>> emit);

  @override
  Future<void> onMount(MountDisplayEvent event, Emitter<AbsDisplayState<T>> emit);

  @override
  Future<void> onRefresh(
      RefreshDisplayEvent event, Emitter<AbsDisplayState<T>> emit);
}

/// 부모 댓글 조회 Bloc
/// T : 부모 Type / S : 참조하는 대상 Type
abstract class AbsDisplayParentCommentBloc<T extends BaseEntity,
    S extends AbsCommentEntity> extends $AbsDisplayCommentBloc<S> {
  final T _ref;

  AbsDisplayParentCommentBloc(this._ref);
}

/// 자식 댓글 조회 Bloc
/// T : 댓글 Type
abstract class AbsDisplayChildCommentBloc<T extends AbsCommentEntity>
    extends $AbsDisplayCommentBloc<T> {
  final T _parentComment;

  AbsDisplayChildCommentBloc(this._parentComment);
}
