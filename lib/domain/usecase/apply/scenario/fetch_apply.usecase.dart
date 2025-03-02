part of '../usecase.dart';

class FetchApplyUseCase {
  final ApplyRepository _repository;

  FetchApplyUseCase(this._repository);

  Future<Either<FailureResult, SuccessResult<List<ApplyEntity>>>> call(
      {required String planId, required String content}) async {
    return await _repository.fetch().then((res) => res.fold(
        (l) => Left(FailureResult.from(l)),
        (r) => Right(SuccessResult<List<ApplyEntity>>.from(r))));
  }
}
