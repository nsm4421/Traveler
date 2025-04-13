part of '../../review.usecase.dart';

class DeleteReviewCommentUseCase extends AbsDeleteCommentUseCase {
  DeleteReviewCommentUseCase(
      {required ReviewCommentRepository super.repository,
      required super.logger});
}
