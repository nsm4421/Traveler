import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:module/data/datasource/export.dart';
import 'package:module/data/model/export.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

import '../logger.mixin.dart';

@LazySingleton(as: JourneyRepository)
class JourneyRepositoryImpl
    with RepositoryLoggerMixIn
    implements JourneyRepository {
  final RemoteAuthDataSource _remoteAuthDataSource;
  final RemoteJourneyDataSource _remoteJourneyDataSource;

  JourneyRepositoryImpl(
      {required RemoteAuthDataSource remoteAuthDataSource,
      required RemoteJourneyDataSource remoteJourneyDataSource})
      : _remoteAuthDataSource = remoteAuthDataSource,
        _remoteJourneyDataSource = remoteJourneyDataSource;

  @override
  Future<Either<ApiFailure, ApiSuccess<void>>> create(
      {required String content,
      required Country country,
      required DateTimeRange dateTimeRange}) async {
    try {
      return await _remoteJourneyDataSource
          .create(CreateJourneyModel(
              content: content,
              country_code: country.code,
              start: dateTimeRange.start.toIso8601String(),
              end: dateTimeRange.end.toIso8601String()))
          .then((_) => ApiSuccess<void>())
          .then(Right.new);
    } catch (error) {
      logger.e(error);
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, ApiSuccess<void>>> delete(String id) async {
    try {
      return await _remoteJourneyDataSource
          .delete(id)
          .then((_) => ApiSuccess<void>())
          .then(Right.new);
    } catch (error) {
      logger.e(error);
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, ApiSuccess<List<JourneyEntity>>>> fetch() async {
    try {
      return await _remoteJourneyDataSource
          .fetch()
          .then((res) => res.map(JourneyEntity.from).toList())
          .then((data) => ApiSuccess<List<JourneyEntity>>(data: data))
          .then(Right.new);
    } catch (error) {
      logger.e(error);
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, ApiSuccess<void>>> modify(
      {required String id,
      required String content,
      required Country country,
      required DateTimeRange dateTimeRange}) async {
    try {
      return await _remoteJourneyDataSource
          .modify(ModifyJourneyModel(
              id: id,
              content: content,
              country_code: country.code,
              start: dateTimeRange.start.toIso8601String(),
              end: dateTimeRange.end.toIso8601String()))
          .then((_) => ApiSuccess<void>())
          .then(Right.new);
    } catch (error) {
      logger.e(error);
      return Left(ApiFailure());
    }
  }
}
