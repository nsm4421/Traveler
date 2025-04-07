import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dio/dio.dart';

import 'package:module/shared/shared.export.dart';

import 'auth/auth.remote_datasource_impl.dart';
import 'database/join_apply/join_apply.remote_datasource_impl.dart';
import 'database/review/review.remote_datasource_impl.dart';
import 'database/trip_plan/trip_plan.remote_datasource_impl.dart';
import 'database/trip_plan/trip_plan_comment.remote_datasource_impl.dart';
import 'storage/auth/auth.storage_datasource_impl.dart';
import 'storage/review/review.storage_datasource_impl.dart';

@module
abstract class RemoteDataSourceModule with LoggerMixIn {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  final _dio = Dio(BaseOptions(
      baseUrl: "http://10.0.2.2:54321",
      connectTimeout: 5.durationInSec,
      receiveTimeout: 3.durationInSec));

  @lazySingleton
  RemoteAuthDataSource get auth => RemoteAuthDataSourceImpl(
      auth: _supabaseClient.auth, dio: _dio, logger: logger);

  @lazySingleton
  RemoteReviewDataSource get review => RemoteReviewDataSourceImpl(
        queryBuilder: _supabaseClient.rest.from(Tables.review.name),
        logger: logger,
      );

  @lazySingleton
  RemoteTripPlanDataSource get tripPlan => RemoteTripPlanDataSourceImpl(
        queryBuilder: _supabaseClient.rest.from(Tables.tripPlan.name),
        logger: logger,
      );

  @lazySingleton
  RemoteTripPlanCommentDataSource get tripPlanComment =>
      RemoteTripPlanCommentDataSourceImpl(
        queryBuilder: _supabaseClient.rest.from(Tables.tripPlanComment.name),
        logger: logger,
      );

  @lazySingleton
  RemoteJoinApplyDataSource get joinApply => RemoteJoinApplyDataSourceImpl(
        queryBuilder: _supabaseClient.rest.from(Tables.joinApply.name),
        logger: logger,
      );

  @lazySingleton
  AuthStorageDataSource get authStorage => AuthStorageDataSourceImpl(
        storage: _supabaseClient.storage.from(Buckets.auth.name),
        dio: _dio,
        logger: logger,
      );

  @lazySingleton
  ReviewStorageDataSource get reviewStorage => ReviewStorageDataSourceImpl(
        storage: _supabaseClient.storage.from(Buckets.review.name),
        dio: _dio,
        logger: logger,
      );
}
