part of '../review.usecase.dart';

class CreateReviewUseCase {
  final ReviewRepository _repository;
  final Logger _logger;

  CreateReviewUseCase(
      {required ReviewRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call(
      {required String content, required List<File> assets}) async {
    try {
      // TODO : 이미지 업로드 기능
      return await _repository
          .create(content: content, images: [])
          .then((res) => const Success<void>())
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
