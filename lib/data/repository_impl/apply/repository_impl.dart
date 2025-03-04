import 'package:injectable/injectable.dart';
import 'package:module/data/datasource/export.dart';
import 'package:module/data/model/export.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

@LazySingleton(as: ApplyRepository)
class ApplyRepositoryImpl with LoggerMixIn implements ApplyRepository {
  final RemoteAuthDataSource _remoteAuthDataSource;
  final RemoteApplyDataSource _remoteApplyDataSource;

  ApplyRepositoryImpl(
      {required RemoteAuthDataSource remoteAuthDataSource,
      required RemoteApplyDataSource remoteApplyDataSource})
      : _remoteAuthDataSource = remoteAuthDataSource,
        _remoteApplyDataSource = remoteApplyDataSource;

  @override
  Future<void> create({required String planId, required String content}) async {
    return await _remoteApplyDataSource.create(CreateApplyModel(
        plan_id: planId,
        uid: _remoteAuthDataSource.currentUid,
        content: content));
  }

  @override
  Future<void> delete(String id) async {
    return await _remoteApplyDataSource.delete(id);
  }

  @override
  Future<List<ApplyEntity>> fetch() async {
    return await _remoteApplyDataSource
        .fetch()
        .then((res) => res.map(ApplyEntity.from).toList());
  }

  @override
  Future<void> modify(
      {required String id,
      required String planId,
      required String content}) async {
    return await _remoteApplyDataSource.modify(ModifyApplyModel(
        id: id,
        plan_id: planId,
        uid: _remoteAuthDataSource.currentUid,
        content: content));
  }
}
