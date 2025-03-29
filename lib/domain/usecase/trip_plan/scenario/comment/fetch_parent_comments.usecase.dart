part of '../../trip_plan.usecase.dart';

class FetchTripPlanParentCommentsUseCase extends AbsFetchParentCommentsUseCase {
  FetchTripPlanParentCommentsUseCase(
      {required TripCommentCommentRepository super.repository,
      required super.logger});
}
