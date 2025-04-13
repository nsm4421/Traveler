part of '../../review.usecase.dart';

class CreateParentReviewCommentUseCase
    extends AbsCreateParentCommentUseCase<ReviewCommentEntity> {
  CreateParentReviewCommentUseCase(
      {required ReviewCommentRepository super.repository,
      required super.logger});
}
