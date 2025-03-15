import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dio/dio.dart';

import 'package:module/shared/shared.export.dart';
import 'auth/datasource.dart';
import 'auth/datasource_impl.dart';
import 'database/trip_plan/datasource.dart';
import 'database/trip_plan/datasource_impl.dart';

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
  RemoteTripPlanDataSource get tripPlan => RemoteTripPlanDataSourceImpl(
        queryBuilder: _supabaseClient.rest.from(Tables.tripPlan.name),
        logger: logger,
      );
}
