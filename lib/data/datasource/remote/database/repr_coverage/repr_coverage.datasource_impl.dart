import 'package:logger/logger.dart';
import 'package:module/shared/export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:module/data/model/repr_coverage/req_create_repr_coverage.model.dart';
import 'package:module/data/model/repr_coverage/res_fetch_repr_coverage.model.dart';

part 'repr_coverage.datasource.dart';

class ReprCoverageDataSourceImpl implements ReprCoverageDataSource {
  final Logger _logger;
  late final PostgrestQueryBuilder _queryBuilder;
  late final Future<Iterable<Map<String, dynamic>>> Function()
      _fetchAllGroupedReprCoveragesCallBack;

  ReprCoverageDataSourceImpl(
      {required Logger logger, required PostgrestClient rest})
      : _logger = logger {
    _queryBuilder = rest.from(Tables.reprCoverage.name);
    _fetchAllGroupedReprCoveragesCallBack = () async =>
        await rest.rpc<Iterable<Map<String, dynamic>>>(
            Rpcs.fetchAllGroupedReprCoverages.name);
  }

  @override
  Future<void> insert(Iterable<CreateReprCoverageRequestModel> models) async {
    final insertedCount = await _queryBuilder
        .insert(models.map((e) => e.toJson()))
        .count(CountOption.exact)
        .then((res) => res.count);
    if (insertedCount != 1) {
      _logger.logWarningOnDataSource('${insertedCount}item inserted');
    }
  }

  @override
  Future<Iterable<FetchReprCoverageResponseModel>> fetchAll() async {
    return await _fetchAllGroupedReprCoveragesCallBack()
        .then((res) => res.map(FetchReprCoverageResponseModel.fromJson));
  }
}
