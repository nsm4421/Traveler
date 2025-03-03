import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:module/shared/shared.export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'apply/remote_datasource.dart';
import 'apply/remote_datasource_impl.dart';
import 'auth/remote_datasource.dart';
import 'auth/remote_datasource_impl.dart';
import 'journey/remote_datasource.dart';
import 'journey/remote_datasource_impl.dart';

@module
abstract class LocalDataSourceModule {}

@module
abstract class RemoteDataSourceModule with LoggerMixIn {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  @lazySingleton
  RemoteAuthDataSource get auth => RemoteAuthDataSourceImpl(
      supabaseClient: _supabaseClient, logger: logger);

  @lazySingleton
  RemoteJourneyDataSource get journey => RemoteJourneyDataSourceImpl(
      supabaseClient: _supabaseClient, logger: logger);

  @lazySingleton
  RemoteApplyDataSource get apply => RemoteApplyDataSourceImpl(
      supabaseClient: _supabaseClient, logger: logger);
}
