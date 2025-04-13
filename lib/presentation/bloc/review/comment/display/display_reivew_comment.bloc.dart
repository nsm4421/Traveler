import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/presentation/bloc/export.dart';
import 'package:module/shared/shared.export.dart';

import 'package:either_dart/either.dart';

import '../../../base/comment/display/abs_display_comment.bloc.dart';
import '../../../base/display/abs_display.bloc.dart';

@injectable
class DisplayParentReviewCommentBloc
    extends AbsDisplayParentCommentBloc<ReviewEntity, ReviewCommentEntity> {
  final ReviewEntity _review;
  final ReviewUseCase _useCase;

  DisplayParentReviewCommentBloc(@factoryParam this._review,
      {required ReviewUseCase useCase})
      : _useCase = useCase,
        super(_review);

  @override
  Future<Either<Failure, Success<List<ReviewCommentEntity>>>> handleFetchEvent(
          FetchDisplayEvent event) async =>
      await _useCase.fetchParentComments
          .call(refId: _review.id, limit: event.limit, cursor: cursor);

  @override
  Future<Either<Failure, Success<List<ReviewCommentEntity>>>> handleMountEvent(
          MountDisplayEvent event) async =>
      await _useCase.fetchParentComments
          .call(refId: _review.id, limit: event.limit);

  @override
  Future<Either<Failure, Success<List<ReviewCommentEntity>>>>
      handleRefreshEvent(RefreshDisplayEvent event) async =>
          await _useCase.fetchParentComments
              .call(refId: _review.id, limit: event.limit);
}
