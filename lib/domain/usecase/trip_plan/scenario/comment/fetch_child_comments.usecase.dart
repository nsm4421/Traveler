part of '../../trip_plan.usecase.dart';

class FetchTripPlanChildCommentsUseCase extends AbsFetchChildCommentsUseCase {
  FetchTripPlanChildCommentsUseCase(
      {required TripCommentCommentRepository super.repository,
      required super.logger});
}
