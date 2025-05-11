import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:module/data/model/benefit/req_create_benefit.model.dart';
import 'package:module/data/model/benefit/res_fetch_benefit.model.dart';
import 'package:module/shared/export.dart';

part 'benefit.datasource.dart';

class BenefitDataSourceImpl implements BenefitDataSource {
  final Logger _logger;
  late final PostgrestQueryBuilder _queryBuilder;

  BenefitDataSourceImpl({required Logger logger, required PostgrestClient rest})
      : _logger = logger {
    _queryBuilder = rest.from(Tables.benefit.name);
  }

  @override
  Future<void> create(CreateBenefitRequestModel model) async {
    final insertedCount = await _queryBuilder
        .insert(model.toJson())
        .count(CountOption.exact)
        .then((res) => res.count);
    if (insertedCount != 1) {
      _logger.logWarningOnDataSource('${insertedCount}item inserted');
    }
  }

  @override
  Future<Iterable<FetchBenefitResponseModel>> fetchAll() async {
    return await _queryBuilder
        .select("*")
        .then((res) => res.map(FetchBenefitResponseModel.fromJson));
  }
}
