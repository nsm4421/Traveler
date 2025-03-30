import 'package:either_dart/either.dart';
import 'package:logger/logger.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

part 'scenario/abs_create_child_comment.usecase.dart';

part 'scenario/abs_create_parent_comment.usecase.dart';

part 'scenario/abs_delete_comment.usecase.dart';

part 'scenario/abs_fetch_children.usecase.dart';

part 'scenario/abs_fetch_parents.usecase.dart';

abstract class AbsCommentUseCase<T extends AbsCommentEntity> {
  AbsCreateParentCommentUseCase<T> get createParentComment;

  AbsCreateChildCommentUseCase<T> get createChildComment;

  AbsFetchParentCommentsUseCase<T> get fetchParentComments;

  AbsFetchChildCommentsUseCase<T> get fetchChildComments;

  AbsDeleteCommentUseCase get deleteComment;
}
