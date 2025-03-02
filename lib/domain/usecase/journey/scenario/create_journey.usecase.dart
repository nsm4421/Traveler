part of '../usecase.dart';

class CreateJourneyUseCase {
  final JourneyRepository _repository;

  CreateJourneyUseCase(this._repository);

  Future<Either<FailureResult, SuccessResult<void>>> call({
    required String content,
    required Country country,
    required DateTimeRange dateTimeRange,
  }) async {
    return await _repository
        .create(
            content: content, country: country, dateTimeRange: dateTimeRange)
        .then((res) => res.fold((l) => Left(FailureResult.from(l)),
            (r) => Right(SuccessResult<void>.from(r))));
  }
}
