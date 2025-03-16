import 'package:module/domain/entity/export.dart';

abstract interface class JoinApplyRepository {
  Future<List<JoinApplyEntity>> fetch(
      {required String tripPlanId, DateTime? cursor, int limit = 20});

  Future<void> create({required String tripPlanId, required String content});

  Future<void> modify({required String id, String? content, bool? isAccepted});

  Future<void> delete(String id);
}
