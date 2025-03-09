import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:module/shared/shared.export.dart';
import 'package:dio/dio.dart';

import 'auth/datasource.dart';
import 'auth/datasource_impl.dart';

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

  // @lazySingleton
  // RemoteTripDataSource get trip =>
  //     RemoteTripDataSourceImpl(supabaseClient: _supabaseClient, logger: logger);
}
