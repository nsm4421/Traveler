part of '../usecase.dart';

class FetchJourneyUseCase {
  final JourneyRepository _repository;

  FetchJourneyUseCase(this._repository);

  Future<Either<FailureResult, SuccessResult<List<JourneyEntity>>>> call({
    required String content,
    required Country country,
    required DateTimeRange dateTimeRange,
  }) async {
    return await _repository.fetch().then((res) => res.fold(
        (l) => Left(FailureResult.from(l)),
        (r) => Right(SuccessResult<List<JourneyEntity>>.from(r))));
  }
}
