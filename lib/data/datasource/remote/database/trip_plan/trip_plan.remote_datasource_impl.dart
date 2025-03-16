import 'package:logger/logger.dart';
import 'package:module/data/model/export.dart';
import 'package:module/shared/shared.export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'trip_plan.remote_datasource.dart';

class RemoteTripPlanDataSourceImpl implements RemoteTripPlanDataSource {
  final PostgrestQueryBuilder _queryBuilder;
  final Logger _logger;

  RemoteTripPlanDataSourceImpl(
      {required PostgrestQueryBuilder queryBuilder, required Logger logger})
      : _queryBuilder = queryBuilder,
        _logger = logger;

  @override
  Future<Iterable<FetchTripPlanModel>> fetch(
      {DateTime? cursor, int limit = 20}) async {
    return await _queryBuilder
        .select("*, creator:${Tables.users.name}(id, username, sex, born_at)")
        .lt('created_at', (cursor ?? DateTime.now()).toUtc().toIso8601String())
        .order('created_at', ascending: false)
        .limit(limit)
        .then((res) {
      if (res.isNotEmpty) {
        _logger.t(res.first);
      }
      return res.map(FetchTripPlanModel.fromJson);
    });
  }

  @override
  Future<Iterable<FetchTripPlanModel>> fetchByUid(
      {required String uid, DateTime? cursor, int limit = 20}) async {
    return await _queryBuilder
        .select("*, creator:${Tables.users.name}(id, username, sex, born_at)")
        .eq("created_by", uid)
        .lt('created_at', (cursor ?? DateTime.now()).toUtc().toIso8601String())
        .order('created_at', ascending: false)
        .limit(limit)
        .then((res) {
      if (res.isNotEmpty) {
        _logger.t(res.first);
      }
      return res.map(FetchTripPlanModel.fromJson);
    });
  }

  @override
  Future<void> create(EditTripPlanModel model) async {
    _logger.t([LogTags.dataSource, model.toJson()]);
    await _queryBuilder.insert(
        {...model.toJson(), 'title': model.title.isEmpty ? null : model.title});
  }

  @override
  Future<void> delete(String id) async {
    _logger.t([LogTags.dataSource, 'delete trip plan id:$id']);
    throw UnimplementedError();
  }

  @override
  Future<void> modify(
      {required String id, required EditTripPlanModel data}) async {
    _logger.t([LogTags.dataSource, data.toJson()]);
    await _queryBuilder.update({...data.toJson()}).eq("id", id);
  }
}
