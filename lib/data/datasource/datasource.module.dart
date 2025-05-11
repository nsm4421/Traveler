import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:module/shared/export.dart';

import 'remote/database/benefit/benefit.datasource_impl.dart';
import 'remote/database/repr_coverage/repr_coverage.datasource_impl.dart';

@module
abstract class LocalDataSourceModule with LoggerMixIn {}

@module
abstract class RemoteDataSourceModule with LoggerMixIn {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  /// 데이터베이스

  // 대표담보
  @lazySingleton
  ReprCoverageDataSource get reprCoverage =>
      ReprCoverageDataSourceImpl(logger: logger, rest: _supabaseClient.rest);

  // 급부
  @lazySingleton
  BenefitDataSource get benefit =>
      BenefitDataSourceImpl(logger: logger, rest: _supabaseClient.rest);
}
