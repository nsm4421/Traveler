part of 'abs_display_comment.bloc.dart';

final class WriteNewCommentEvent<T extends AbsCommentEntity>
    extends AbsDisplayEvent {
  final T newComment;

  WriteNewCommentEvent(this.newComment);
}
