part of '../../trip_plan.usecase.dart';

class CreateTripPlanChildCommentUseCase
    extends AbsCreateChildCommentUseCase<TripPlanCommentEntity> {
  CreateTripPlanChildCommentUseCase(
      {required TripCommentCommentRepository super.repository,
      required super.logger});
}
