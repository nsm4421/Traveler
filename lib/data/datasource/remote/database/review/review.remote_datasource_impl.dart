import 'package:logger/logger.dart';
import 'package:module/data/model/export.dart';
import 'package:module/shared/shared.export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'review.remote_datasource.dart';

class RemoteReviewDataSourceImpl
    with UtcMixIn
    implements RemoteReviewDataSource {
  final PostgrestQueryBuilder _queryBuilder;
  final Logger _logger;

  RemoteReviewDataSourceImpl(
      {required PostgrestQueryBuilder queryBuilder, required Logger logger})
      : _queryBuilder = queryBuilder,
        _logger = logger;

  @override
  Future<void> create(CreateReviewModel model) async {
    return await _queryBuilder.insert(model.toJson());
  }

  @override
  Future<void> softDelete(String id) async {
    return await _queryBuilder
        .update({'removed_at': nowDt, 'updated_at': nowDt}).eq('id', id);
  }

  @override
  Future<Iterable<FetchReviewModel>> fetch(
      {DateTime? cursor, int limit = 20}) async {
    return await _queryBuilder
        .select("*, creator:${Tables.users.name}(id, username, sex, born_at)")
        .lt('created_at', cursor ?? nowDt)
        .filter('removed_at', 'is', null)
        .order('created_at', ascending: true) // 최신순
        .limit(limit)
        .then((res) => res.map(FetchReviewModel.fromJson));
  }

  @override
  Future<FetchReviewModel> findById(String id) async {
    return await _queryBuilder
        .select("*, creator:${Tables.users.name}(id, username, sex, born_at)")
        .eq('id', id)
        .filter('removed_at', 'is', null)
        .then((res) => res.first)
        .then(FetchReviewModel.fromJson);
  }
}
