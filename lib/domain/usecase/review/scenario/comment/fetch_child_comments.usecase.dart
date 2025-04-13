part of '../../review.usecase.dart';

class FetchChildReviewCommentsUseCase
    extends AbsFetchChildCommentsUseCase<ReviewCommentEntity> {
  FetchChildReviewCommentsUseCase({
    required ReviewCommentRepository super.repository,
    required super.logger,
  });
}
