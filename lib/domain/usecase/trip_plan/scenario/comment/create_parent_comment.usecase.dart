part of '../../trip_plan.usecase.dart';

class CreateTripPlanParentCommentUseCase
    extends AbsCreateParentCommentUseCase<TripPlanCommentEntity> {
  CreateTripPlanParentCommentUseCase(
      {required TripCommentCommentRepository super.repository,
      required super.logger});
}
