part of '../usecase.dart';

class CreateApplyUseCase {
  final ApplyRepository _repository;

  CreateApplyUseCase(this._repository);

  Future<Either<FailureResult, SuccessResult<void>>> call(
      {required String planId, required String content}) async {
    return await _repository.create(planId: planId, content: content).then(
        (res) => res.fold((l) => Left(FailureResult.from(l)),
            (r) => Right(SuccessResult<void>.from(r))));
  }
}
