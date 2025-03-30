part of '../../trip_plan.usecase.dart';

class FetchTripPlanParentCommentsUseCase
    extends AbsFetchParentCommentsUseCase<TripPlanCommentEntity> {
  FetchTripPlanParentCommentsUseCase({
    required TripCommentCommentRepository super.repository,
    required super.logger,
  });
}
