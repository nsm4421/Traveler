import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

part 'scenario/create_review.usecase.dart';

part 'scenario/fetch_review.usecase.dart';

part 'scenario/delete_review.usecase.dart';

@lazySingleton
class ReviewUseCase with LoggerMixIn {
  final ReviewRepository _reviewRepository;

  ReviewUseCase({required ReviewRepository reviewRepository})
      : _reviewRepository = reviewRepository;

  CreateReviewUseCase get createReview =>
      CreateReviewUseCase(repository: _reviewRepository, logger: logger);

  FetchReviewsUseCase get fetchReview =>
      FetchReviewsUseCase(repository: _reviewRepository, logger: logger);

  DeleteReviewUseCase get deleteReview =>
      DeleteReviewUseCase(repository: _reviewRepository, logger: logger);
}
