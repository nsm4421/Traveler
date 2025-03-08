import 'package:logger/logger.dart';
import 'package:module/data/model/export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'datasource.dart';

class RemoteJourneyDataSourceImpl implements RemoteJourneyDataSource {
  final SupabaseClient _supabaseClient;
  final Logger _logger;

  RemoteJourneyDataSourceImpl(
      {required SupabaseClient supabaseClient, required Logger logger})
      : _supabaseClient = supabaseClient,
        _logger = logger;

  String get _tableName => 'journey';

  @override
  Future<void> create(CreateJourneyModel model) async {
    await _supabaseClient.from(_tableName).insert(model.toJson());
  }

  @override
  Future<void> delete(String id) async {
    await _supabaseClient.from(_tableName).delete().eq("id", id);
  }

  @override
  Future<Iterable<JourneyModel>> fetch() async {
    return await _supabaseClient
        .from(_tableName)
        .select("*")
        .then((res) => res.map(JourneyModel.fromJson));
  }

  @override
  Future<void> modify(ModifyJourneyModel model) async {
    await _supabaseClient
        .from(_tableName)
        .update(model.toJson())
        .eq("id", model.id);
  }
}
