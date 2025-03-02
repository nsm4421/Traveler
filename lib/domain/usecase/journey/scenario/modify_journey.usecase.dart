part of '../usecase.dart';

class ModifyJourneyUseCase {
  final JourneyRepository _repository;

  ModifyJourneyUseCase(this._repository);

  Future<Either<FailureResult, SuccessResult<void>>> call({
    required String id,
    required String content,
    required Country country,
    required DateTimeRange dateTimeRange,
  }) async {
    return await _repository
        .modify(
            id: id,
            content: content,
            country: country,
            dateTimeRange: dateTimeRange)
        .then((res) => res.fold((l) => Left(FailureResult.from(l)),
            (r) => Right(SuccessResult<void>.from(r))));
  }
}
