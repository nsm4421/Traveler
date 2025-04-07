part of '../auth.usecase.dart';

class EditProfileUseCase {
  final AuthRepository _repository;
  final Logger _logger;

  EditProfileUseCase(
      {required AuthRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call({
    String? description,
    Sex? sex,
    DateTime? bornAt,
    File? profileImage,
  }) async {
    try {
      return await _repository
          .editProfile(
              description: description,
              sex: sex,
              bornAt: bornAt,
              profileImage: profileImage)
          .then((_) => const Success<void>())
          .then(Right.new);
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
