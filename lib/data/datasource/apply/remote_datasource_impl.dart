import 'package:logger/logger.dart';
import 'package:module/data/model/export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'remote_datasource.dart';

class RemoteApplyDataSourceImpl implements RemoteApplyDataSource {
  final SupabaseClient _supabaseClient;
  final Logger _logger;

  RemoteApplyDataSourceImpl(
      {required SupabaseClient supabaseClient, required Logger logger})
      : _supabaseClient = supabaseClient,
        _logger = logger;

  @override
  Future<void> create(CreateApplyModel model) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Iterable<ApplyModel>> fetch() {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<void> modify(ModifyApplyModel model) {
    // TODO: implement modify
    throw UnimplementedError();
  }
}
