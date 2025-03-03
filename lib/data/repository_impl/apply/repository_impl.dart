import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:module/data/datasource/export.dart';
import 'package:module/data/model/export.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

import '../logger.mixin.dart';

@LazySingleton(as: ApplyRepository)
class ApplyRepositoryImpl
    with RepositoryLoggerMixIn
    implements ApplyRepository {
  final RemoteAuthDataSource _remoteAuthDataSource;
  final RemoteApplyDataSource _remoteApplyDataSource;

  ApplyRepositoryImpl(
      {required RemoteAuthDataSource remoteAuthDataSource,
      required RemoteApplyDataSource remoteApplyDataSource})
      : _remoteAuthDataSource = remoteAuthDataSource,
        _remoteApplyDataSource = remoteApplyDataSource;

  @override
  Future<Either<ApiFailure, ApiSuccess<void>>> create(
      {required String planId, required String content}) async {
    try {
      return await _remoteApplyDataSource
          .create(CreateApplyModel(
              plan_id: planId,
              uid: _remoteAuthDataSource.currentUid,
              content: content))
          .then((_) => ApiSuccess<void>())
          .then(Right.new);
    } catch (error) {
      logger.e([LogTags.repository.name, error]);
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, ApiSuccess<void>>> delete(String id) async {
    try {
      return await _remoteApplyDataSource
          .delete(id)
          .then((_) => ApiSuccess<void>())
          .then(Right.new);
    } catch (error) {
      logger.e([LogTags.repository.name, error]);
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, ApiSuccess<List<ApplyEntity>>>> fetch() async {
    try {
      return await _remoteApplyDataSource
          .fetch()
          .then((res) => res.map(ApplyEntity.from).toList())
          .then((data) => ApiSuccess<List<ApplyEntity>>(data: data))
          .then(Right.new);
    } catch (error) {
      logger.e([LogTags.repository.name, error]);
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, ApiSuccess<void>>> modify(
      {required String id,
      required String planId,
      required String content}) async {
    try {
      return await _remoteApplyDataSource
          .modify(ModifyApplyModel(
              id: id,
              plan_id: planId,
              uid: _remoteAuthDataSource.currentUid,
              content: content))
          .then((_) => ApiSuccess<void>())
          .then(Right.new);
    } catch (error) {
      logger.e([LogTags.repository.name, error]);
      return Left(ApiFailure());
    }
  }
}
