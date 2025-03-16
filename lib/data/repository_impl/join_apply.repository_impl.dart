import 'package:injectable/injectable.dart';
import 'package:module/data/datasource/export.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

@LazySingleton(as: JoinApplyRepository)
class JoinApplyRepositoryImpl with LoggerMixIn implements JoinApplyRepository {
  final LocalStorageDataSource _localStorageDataSource;
  final RemoteJoinApplyDataSource _remoteJoinApplyDataSource;

  JoinApplyRepositoryImpl(
      {required LocalStorageDataSource localStorageDataSource,
      required RemoteJoinApplyDataSource remoteJoinApplyDataSource})
      : _localStorageDataSource = localStorageDataSource,
        _remoteJoinApplyDataSource = remoteJoinApplyDataSource;

  @override
  Future<void> create(
      {required String tripPlanId, required String content}) async {
    return await _remoteJoinApplyDataSource.create(
        tripPlanId: tripPlanId, content: content);
  }

  @override
  Future<void> delete(String id) async {
    return await _remoteJoinApplyDataSource.delete(id);
  }

  @override
  Future<List<JoinApplyEntity>> fetch(
      {required String tripPlanId, DateTime? cursor, int limit = 20}) async {
    return await _remoteJoinApplyDataSource
        .fetch(tripPlanId: tripPlanId, cursor: cursor, limit: limit)
        .then((res) => res.map(JoinApplyEntity.from).toList());
  }

  @override
  Future<void> modify(
      {required String id, String? content, bool? isAccepted}) async {
    return await _remoteJoinApplyDataSource.modify(
        id: id, content: content, isAccepted: isAccepted);
  }
}
