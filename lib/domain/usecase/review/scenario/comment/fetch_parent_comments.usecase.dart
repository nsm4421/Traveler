part of '../../review.usecase.dart';

class FetchParentReviewCommentsUseCase
    extends AbsFetchParentCommentsUseCase<ReviewCommentEntity> {
  FetchParentReviewCommentsUseCase({
    required ReviewCommentRepository super.repository,
    required super.logger,
  });
}
