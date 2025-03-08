import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:module/shared/shared.export.dart';
import 'package:dio/dio.dart';

import 'apply/datasource.dart';
import 'apply/datasource_impl.dart';
import 'auth/datasource.dart';
import 'auth/datasource_impl.dart';
import 'journey/datasource.dart';
import 'journey/datasource_impl.dart';

@module
abstract class RemoteDataSourceModule with LoggerMixIn {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  final _dio = Dio(BaseOptions(
      baseUrl: "http://10.0.2.2:3000",
      connectTimeout: 5.durationInSec,
      receiveTimeout: 3.durationInSec));

  @lazySingleton
  RemoteAuthDataSource get auth =>
      RemoteAuthDataSourceImpl(auth: _supabaseClient.auth, logger: logger);

  @lazySingleton
  RemoteJourneyDataSource get journey => RemoteJourneyDataSourceImpl(
      supabaseClient: _supabaseClient, logger: logger);

  @lazySingleton
  RemoteApplyDataSource get apply => RemoteApplyDataSourceImpl(
      supabaseClient: _supabaseClient, logger: logger);
}
