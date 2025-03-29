part of '../../trip_plan.usecase.dart';

class DeleteTripPlanCommentUseCase extends AbsDeleteCommentUseCase {
  DeleteTripPlanCommentUseCase(
      {required TripCommentCommentRepository super.repository,
      required super.logger});
}
