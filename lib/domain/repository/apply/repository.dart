import 'package:either_dart/either.dart';
import 'package:module/domain/entity/apply/entity.dart';
import 'package:module/shared/shared.export.dart';

abstract interface class ApplyRepository {
  Future<Either<ApiFailure, ApiSuccess<void>>> create({
    required String planId,
    required String content,
  });

  Future<Either<ApiFailure, ApiSuccess<List<ApplyEntity>>>> fetch();

  Future<Either<ApiFailure, ApiSuccess<void>>> modify({
    required String id,
    required String planId,
    required String content,
  });

  Future<Either<ApiFailure, ApiSuccess<void>>> delete(String id);
}
