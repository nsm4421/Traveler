part of '../benefit.usecase.dart';

class CreateBenefitUseCase {
  final BenefitRepository _repository;
  final Logger _logger;

  CreateBenefitUseCase(
      {required BenefitRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call({
    String? riskUnitCode,
    required BenefitCategory category,
    required String name,
  }) async {
    try {
      return await _repository
          .create(riskUnitCode: riskUnitCode, category: category, name: name)
          .then((_) => const Success<void>())
          .then(Right.new);
    } catch (error) {
      _logger.logErrorOnUseCase(error);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
