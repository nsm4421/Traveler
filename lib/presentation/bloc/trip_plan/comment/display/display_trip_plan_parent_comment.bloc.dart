import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import 'package:module/domain/entity/export.dart';
import 'package:module/domain/usecase/export.dart';
import 'package:module/shared/shared.export.dart';

import '../../../base/comment/display/abs_display_comment.bloc.dart';
import '../../../base/display/abs_display.bloc.dart';

@injectable
class DisplayTripPlanParentCommentBloc
    extends AbsDisplayParentCommentBloc<TripPlanEntity, TripPlanCommentEntity> {
  final TripPlanEntity _tripPlan;
  final TripPlanUseCase _useCase;

  DisplayTripPlanParentCommentBloc(@factoryParam this._tripPlan,
      {required TripPlanUseCase useCase})
      : _useCase = useCase,
        super(_tripPlan);

  @override
  Future<Either<Failure, Success<List<TripPlanCommentEntity>>>>
      handleFetchEvent(FetchDisplayEvent event) async =>
          await _useCase.fetchParentComments
              .call(refId: _tripPlan.id, limit: event.limit, cursor: cursor);

  @override
  Future<Either<Failure, Success<List<TripPlanCommentEntity>>>>
      handleMountEvent(MountDisplayEvent event) async =>
          await _useCase.fetchParentComments
              .call(refId: _tripPlan.id, limit: event.limit);

  @override
  Future<Either<Failure, Success<List<TripPlanCommentEntity>>>>
      handleRefreshEvent(RefreshDisplayEvent event) async =>
          await _useCase.fetchParentComments
              .call(refId: _tripPlan.id, limit: event.limit);
}
