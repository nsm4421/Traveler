import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'package:module/shared/export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'benefit/benefit.datasource_impl.dart';
import 'repr_coverage/repr_coverage.datasource_impl.dart';

class RemoteDatabaseModule {
  final PostgrestClient _rest;
  final Logger _logger;

  RemoteDatabaseModule({required PostgrestClient rest, required Logger logger})
      : _rest = rest,
        _logger = logger;

  // 대표담보
  @lazySingleton
  ReprCoverageDataSource get reprCoverage =>
      ReprCoverageDataSourceImpl(logger: _logger, rest: _rest);

  // 급부
  @lazySingleton
  BenefitDataSource get benefit =>
      BenefitDataSourceImpl(logger: _logger, rest: _rest);
}
