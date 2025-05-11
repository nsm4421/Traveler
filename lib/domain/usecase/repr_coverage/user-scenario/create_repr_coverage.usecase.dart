part of '../repr_coverage.usecase.dart';

class CreateSingleBenefitReprCoverageUseCase {
  final ReprCoverageRepository _repository;
  final Logger _logger;

  CreateSingleBenefitReprCoverageUseCase(
      {required ReprCoverageRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call({
    required String code,
    required String name,
    required CoverageCategory category,
    required BenefitEntity benefit,
  }) async {
    try {
      return await _repository
          .createSingleBenefitReprCoverage(
              code: code, name: name, category: category, benefit: benefit)
          .then((_) => const Success<void>())
          .then(Right.new);
    } catch (error) {
      _logger.logErrorOnUseCase(error);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}

class CreateMultiBenefitReprCoverageUseCase {
  final ReprCoverageRepository _repository;
  final Logger _logger;

  CreateMultiBenefitReprCoverageUseCase(
      {required ReprCoverageRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call({
    required String code,
    required String name,
    required CoverageCategory category,
    required List<BenefitEntity> benefits,
  }) async {
    try {
      return await _repository
          .createMultiBenefitReprCoverage(
              code: code, name: name, category: category, benefits: benefits)
          .then((_) => const Success<void>())
          .then(Right.new);
    } catch (error) {
      _logger.logErrorOnUseCase(error);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}

class CreateMultiDetailedCoverageReprCoverageUseCase {
  final ReprCoverageRepository _repository;
  final Logger _logger;

  CreateMultiDetailedCoverageReprCoverageUseCase(
      {required ReprCoverageRepository repository, required Logger logger})
      : _repository = repository,
        _logger = logger;

  Future<Either<Failure, Success<void>>> call({
    required String code,
    required String name,
    required CoverageCategory category,
    required List<DetailedCoverageEntity> detailedCoverages,
  }) async {
    try {
      return await _repository
          .createMultiDetailedCoverageReprCoverage(
              code: code,
              name: name,
              category: category,
              detailedCoverages: detailedCoverages)
          .then((_) => const Success<void>())
          .then(Right.new);
    } catch (error) {
      _logger.logErrorOnUseCase(error);
      return const Left(Failure(message: 'error occurs on use case'));
    }
  }
}
