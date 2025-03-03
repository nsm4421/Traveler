import 'package:logger/logger.dart';
import 'package:module/data/model/export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'remote_datasource.dart';

class RemoteJourneyDataSourceImpl implements RemoteJourneyDataSource {
  final SupabaseClient _supabaseClient;
  final Logger _logger;

  RemoteJourneyDataSourceImpl(
      {required SupabaseClient supabaseClient, required Logger logger})
      : _supabaseClient = supabaseClient,
        _logger = logger;

  @override
  Future<void> create(CreateJourneyModel model) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Iterable<JourneyModel>> fetch() {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<void> modify(ModifyJourneyModel model) {
    // TODO: implement modify
    throw UnimplementedError();
  }
}
