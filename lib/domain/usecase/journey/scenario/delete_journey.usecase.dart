part of '../usecase.dart';

class DeleteJourneyUseCase {
  final JourneyRepository _repository;

  DeleteJourneyUseCase(this._repository);

  Future<Either<FailureResult, SuccessResult<void>>> call(String id) async {
    return await _repository.delete(id).then((res) => res.fold(
        (l) => Left(FailureResult.from(l)),
        (r) => Right(SuccessResult<void>.from(r))));
  }
}
