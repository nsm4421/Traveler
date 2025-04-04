import 'package:logger/logger.dart';
import 'package:module/data/model/export.dart';
import 'package:module/shared/shared.export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'join_apply.remote_datasource.dart';

class RemoteJoinApplyDataSourceImpl
    with UtcMixIn
    implements RemoteJoinApplyDataSource {
  final PostgrestQueryBuilder _queryBuilder;
  final Logger _logger;

  RemoteJoinApplyDataSourceImpl(
      {required PostgrestQueryBuilder queryBuilder, required Logger logger})
      : _queryBuilder = queryBuilder,
        _logger = logger;

  @override
  Future<Iterable<FetchJoinApplyModel>> fetch(
      {required String tripPlanId, DateTime? cursor, int limit = 20}) async {
    return await _queryBuilder
        .select("*, creator:${Tables.users.name}(id, username, sex, born_at)")
        .eq("trip_plan_id", tripPlanId)
        .lt('created_at', cursor?.utcString ?? now)
        .order('created_at', ascending: false)
        .limit(limit)
        .then((res) {
      if (res.isNotEmpty) {
        _logger.t(res.first);
      }
      return res.map(FetchJoinApplyModel.fromJson);
    });
  }

  @override
  Future<void> create(
      {required String tripPlanId, required String content}) async {
    await _queryBuilder.insert(
        CreateJoinApplyModel(trip_plan_id: tripPlanId, content: content)
            .toJson());
  }

  @override
  Future<void> modify(
      {required String id, bool? isAccepted, String? content}) async {
    _logger.t([
      LogTags.dataSource,
      "modify apply|id:$id|content:$content|isAccepted:$isAccepted"
    ]);
    await _queryBuilder
        .update({
          if (isAccepted != null) 'is_accepted': isAccepted,
          if (content != null) 'content': content
        })
        .eq('id', id)
        .maybeSingle();
  }

  @override
  Future<void> delete(String id) async {
    await _queryBuilder.delete().eq("id", id);
  }
}
