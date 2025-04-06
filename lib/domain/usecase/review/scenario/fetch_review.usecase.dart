part of '../review.usecase.dart';

class FetchReviewsUseCase {
  final ReviewRepository _repository;
  final Logger _logger;

  FetchReviewsUseCase(
      {required ReviewRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<List<ReviewEntity>>>> call(
      {DateTime? cursor, int limit = 20}) async {
    try {
      return await _repository
          .fetch(cursor: cursor, limit: limit)
          .then((res) => Success<List<ReviewEntity>>(data: res))
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}

class FindReviewByIdUseCase {
  final ReviewRepository _repository;
  final Logger _logger;

  FindReviewByIdUseCase(
      {required ReviewRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<ReviewEntity>>> call(String id) async {
    try {
      return await _repository
          .findById(id)
          .then((res) => Success<ReviewEntity>(data: res))
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
