import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

import '../comment/abs_comment.usecase.dart';

part 'scenario/create_review.usecase.dart';

part 'scenario/fetch_review.usecase.dart';

part 'scenario/delete_review.usecase.dart';

part 'scenario/comment/create_child_comment.usecase.dart';

part 'scenario/comment/create_parent_comment.usecase.dart';

part 'scenario/comment/delete_comment.usecase.dart';

part 'scenario/comment/fetch_parent_comments.usecase.dart';

part 'scenario/comment/fetch_child_comments.usecase.dart';

@lazySingleton
class ReviewUseCase with LoggerMixIn {
  final ReviewRepository _reviewRepository;

  final ReviewCommentRepository _reviewCommentRepository;

  ReviewUseCase(
      {required ReviewRepository reviewRepository,
      required ReviewCommentRepository reviewCommentRepository})
      : _reviewRepository = reviewRepository,
        _reviewCommentRepository = reviewCommentRepository;

  /// review
  CreateReviewUseCase get createReview =>
      CreateReviewUseCase(repository: _reviewRepository, logger: logger);

  FetchReviewsUseCase get fetchReview =>
      FetchReviewsUseCase(repository: _reviewRepository, logger: logger);

  DeleteReviewUseCase get deleteReview =>
      DeleteReviewUseCase(repository: _reviewRepository, logger: logger);

  /// review comment
  CreateParentReviewCommentUseCase get createParentComment =>
      CreateParentReviewCommentUseCase(
          repository: _reviewCommentRepository, logger: logger);

  CreateChildReviewCommentUseCase get createChildComment =>
      CreateChildReviewCommentUseCase(
          repository: _reviewCommentRepository, logger: logger);

  DeleteReviewCommentUseCase get deleteComment => DeleteReviewCommentUseCase(
      repository: _reviewCommentRepository, logger: logger);

  FetchParentReviewCommentsUseCase get fetchParentComments =>
      FetchParentReviewCommentsUseCase(
          repository: _reviewCommentRepository, logger: logger);

  FetchChildReviewCommentsUseCase get fetchChildComment =>
      FetchChildReviewCommentsUseCase(
          repository: _reviewCommentRepository, logger: logger);
}
