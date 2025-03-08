part of '../usecase.dart';

class SignUpUseCase {
  final AuthRepository _repository;
  final Logger _logger;

  SignUpUseCase({required AuthRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  // TODO : 프로필 사진 업롣 기능
  Future<Either<Failure, Success<void>>> call(
      {required String username,
        required String email,
        required String description,
        required Sex sex,
        required DateTime bornAt,
        required String password}) async {
    try {
      return await _repository
          .signUp(
          username: username,
          email: email,
          description: description,
          sex: sex,
          bornAt: bornAt,
          password: password)
          .then((_)=>Right(Success<void>()));
    } catch (error) {
      _logger.e([LogTags.useCase, error]);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
