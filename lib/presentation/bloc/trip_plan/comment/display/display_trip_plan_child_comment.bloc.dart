import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';

import 'package:module/domain/entity/export.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../../base/comment/display/abs_display_comment.bloc.dart';
import '../../../base/display/abs_display.bloc.dart';

@injectable
class DisplayTripPlanChildCommentBloc
    extends AbsDisplayChildCommentBloc<TripPlanCommentEntity> {
  final TripPlanCommentEntity _parentTripPlanComment;
  final TripPlanUseCase _useCase;

  DisplayTripPlanChildCommentBloc(@factoryParam this._parentTripPlanComment,
      {required TripPlanUseCase useCase})
      : _useCase = useCase,
        super(_parentTripPlanComment);

  @override
  Future<Either<Failure, Success<List<TripPlanCommentEntity>>>>
      handleFetchEvent(FetchDisplayEvent event) async =>
          await _useCase.fetchChildComments.call(
              parentCommentId: _parentTripPlanComment.id,
              limit: event.limit,
              cursor: cursor);

  @override
  Future<Either<Failure, Success<List<TripPlanCommentEntity>>>>
      handleMountEvent(MountDisplayEvent event) async => await _useCase
          .fetchChildComments
          .call(parentCommentId: _parentTripPlanComment.id, limit: event.limit);

  @override
  Future<Either<Failure, Success<List<TripPlanCommentEntity>>>>
      handleRefreshEvent(RefreshDisplayEvent event) async => await _useCase
          .fetchChildComments
          .call(parentCommentId: _parentTripPlanComment.id, limit: event.limit);
}
