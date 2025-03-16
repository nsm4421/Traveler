part of 'join_apply.remote_datasource_impl.dart';

abstract interface class RemoteJoinApplyDataSource {
  Future<void> create({required String tripPlanId, required String content});

  Future<Iterable<FetchJoinApplyModel>> fetch(
      {required String tripPlanId, DateTime? cursor, int limit = 20});

  Future<void> modify({required String id, bool? isAccepted, String? content});

  Future<void> delete(String id);
}
