import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/shared/shared.export.dart';

abstract interface class JourneyRepository {
  Future<Either<ApiFailure, ApiSuccess<void>>> create({
    required String content,
    required Country country,
    required DateTimeRange dateTimeRange,
  });

  Future<Either<ApiFailure, ApiSuccess<List<JourneyEntity>>>> fetch();

  Future<Either<ApiFailure, ApiSuccess<void>>> modify({
    required String id,
    required String content,
    required Country country,
    required DateTimeRange dateTimeRange,
  });

  Future<Either<ApiFailure, ApiSuccess<void>>> delete(String id);
}
