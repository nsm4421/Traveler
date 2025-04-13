part of '../../review.usecase.dart';

class CreateChildReviewCommentUseCase
    extends AbsCreateChildCommentUseCase<ReviewCommentEntity> {
  CreateChildReviewCommentUseCase(
      {required ReviewCommentRepository super.repository,
      required super.logger});
}
