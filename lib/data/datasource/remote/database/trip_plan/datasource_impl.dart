import 'package:logger/logger.dart';
import 'package:module/data/model/export.dart';
import 'package:module/shared/shared.export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'datasource.dart';

class RemoteTripPlanDataSourceImpl implements RemoteTripPlanDataSource {
  final PostgrestClient _postgrestClient;
  final String _tableName;
  final Logger _logger;

  RemoteTripPlanDataSourceImpl(
      {required PostgrestClient postgrestClient,
      required String tableName,
      required Logger logger})
      : _postgrestClient = postgrestClient,
        _tableName = tableName,
        _logger = logger;

  @override
  Future<void> create(EditTripPlanModel model) async {
    _logger.t([LogTags.dataSource, model.toJson()]);
    await _postgrestClient.from(_tableName).insert(model.toJson());
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
    await _postgrestClient
        .from(_tableName)
        .update({...data.toJson()}).eq("id", id);
  }
}
