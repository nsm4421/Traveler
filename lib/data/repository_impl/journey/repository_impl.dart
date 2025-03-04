import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:module/data/datasource/export.dart';
import 'package:module/data/model/export.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

@LazySingleton(as: JourneyRepository)
class JourneyRepositoryImpl with LoggerMixIn implements JourneyRepository {
  final RemoteAuthDataSource _remoteAuthDataSource;
  final RemoteJourneyDataSource _remoteJourneyDataSource;

  JourneyRepositoryImpl(
      {required RemoteAuthDataSource remoteAuthDataSource,
      required RemoteJourneyDataSource remoteJourneyDataSource})
      : _remoteAuthDataSource = remoteAuthDataSource,
        _remoteJourneyDataSource = remoteJourneyDataSource;

  @override
  Future<void> create(
      {required String content,
      required Country country,
      required DateTimeRange dateTimeRange}) async {
    return await _remoteJourneyDataSource.create(CreateJourneyModel(
        content: content,
        country_code: country.code,
        start: dateTimeRange.start.toIso8601String(),
        end: dateTimeRange.end.toIso8601String()));
  }

  @override
  Future<void> delete(String id) async {
    return await _remoteJourneyDataSource.delete(id);
  }

  @override
  Future<List<JourneyEntity>> fetch() async {
    return await _remoteJourneyDataSource
        .fetch()
        .then((res) => res.map(JourneyEntity.from).toList());
  }

  @override
  Future<void> modify(
      {required String id,
      required String content,
      required Country country,
      required DateTimeRange dateTimeRange}) async {
    return await _remoteJourneyDataSource.modify(ModifyJourneyModel(
        id: id,
        content: content,
        country_code: country.code,
        start: dateTimeRange.start.toIso8601String(),
        end: dateTimeRange.end.toIso8601String()));
  }
}
