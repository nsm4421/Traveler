import 'package:logger/logger.dart';
import 'package:module/data/model/export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'datasource.dart';

class RemoteApplyDataSourceImpl implements RemoteApplyDataSource {
  final SupabaseClient _supabaseClient;
  final Logger _logger;

  RemoteApplyDataSourceImpl(
      {required SupabaseClient supabaseClient, required Logger logger})
      : _supabaseClient = supabaseClient,
        _logger = logger;

  String get _tableName => 'apply';

  @override
  Future<void> create(CreateApplyModel model) async {
    await _supabaseClient.from(_tableName).insert(model.toJson());
  }

  @override
  Future<void> delete(String id) async {
    await _supabaseClient.from(_tableName).delete().eq("id", id);
  }

  @override
  Future<Iterable<ApplyModel>> fetch() async {
    return await _supabaseClient
        .from(_tableName)
        .select("*")
        .then((res) => res.map(ApplyModel.fromJson));
  }

  @override
  Future<void> modify(ModifyApplyModel model) async {
    await _supabaseClient
        .from(_tableName)
        .update(model.toJson())
        .eq("id", model.id);
  }
}
