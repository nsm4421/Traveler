part of '../review.usecase.dart';

class CreateReviewUseCase {
  final ReviewRepository _repository;
  final Logger _logger;

  CreateReviewUseCase(
      {required ReviewRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call(
      {required Country country,
      String? title,
      required List<String> captions,
      required List<String> hashtags,
      required String content,
      required List<File> assets}) async {
    try {
      return await _repository
          .create(
              country_code: country.code,
              title: title,
              captions: captions,
              content: content,
              imageFiles: assets,
              hashtags: hashtags)
          .then((res) => const Success<void>())
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
