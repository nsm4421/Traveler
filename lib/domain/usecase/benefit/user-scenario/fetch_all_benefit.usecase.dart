part of '../benefit.usecase.dart';

class FetchAllBenefitUseCase {
  final BenefitRepository _repository;
  final Logger _logger;

  FetchAllBenefitUseCase(
      {required BenefitRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<List<BenefitEntity>>>> call() async {
    try {
      return await _repository
          .fetchAll()
          .then((data) => Success<List<BenefitEntity>>(data: data))
          .then(Right.new);
    } catch (error) {
      _logger.logErrorOnUseCase(error);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
