part of '../usecase.dart';

class ModifyApplyUseCase {
  final ApplyRepository _repository;

  ModifyApplyUseCase(this._repository);

  Future<Either<FailureResult, SuccessResult<void>>> call(
      {required String id,
      required String planId,
      required String content}) async {
    return await _repository
        .modify(id: id, planId: planId, content: content)
        .then((res) => res.fold((l) => Left(FailureResult.from(l)),
            (r) => Right(SuccessResult<void>.from(r))));
  }
}
