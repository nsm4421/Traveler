import 'package:logger/logger.dart';
import 'package:module/data/model/export.dart';
import 'package:module/shared/shared.export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'abs_comment.remote_datasource.dart';

abstract class AbsRemoteCommentDataSourceImpl implements AbsRemoteCommentDataSource {
  final PostgrestQueryBuilder _queryBuilder;
  final Logger _logger;

  AbsRemoteCommentDataSourceImpl(
      {required PostgrestQueryBuilder queryBuilder, required Logger logger})
      : _queryBuilder = queryBuilder,
        _logger = logger;

  String get _now => DateTime.now().toUtc().toIso8601String();

  @override
  Future<void> createChild(
      {required String refId,
      required String parentId,
      required String content}) async {
    return await _queryBuilder.insert(CreateChildCommentModel(
        ref_id: refId, parentId: parentId, content: content));
  }

  @override
  Future<void> createParent(
      {required String refId, required String content}) async {
    return await _queryBuilder
        .insert(CreateParentCommentModel(ref_id: refId, content: content));
  }

  @override
  Future<void> softDelete(String commentId) async {
    await _queryBuilder.update({'removed_at': _now}).eq("id", commentId);
  }

  @override
  Future<Iterable<FetchChildCommentModel>> fetchChildren(
      {required String parentCommentId,
      DateTime? cursor,
      int limit = 20}) async {
    return await _queryBuilder
        .select("*, creator:${Tables.users.name}(id, username, sex, born_at)")
        .eq("parent_id", parentCommentId)
        .lt('created_at', (cursor ?? _now))
        .order('created_at', ascending: false)
        .limit(limit)
        .then((res) => res.map(FetchChildCommentModel.fromJson));
  }

  @override
  Future<Iterable<FetchParentCommentModel>> fetchParents(
      {required String refId, DateTime? cursor, int limit = 20}) async {
    return await _queryBuilder
        .select("*, creator:${Tables.users.name}(id, username, sex, born_at)")
        .eq("ref_id", refId)
        .isFilter("parent_id", null)
        .lt('created_at', (cursor ?? _now))
        .order('created_at', ascending: false)
        .limit(limit)
        .then((res) => res.map(FetchParentCommentModel.fromJson));
  }
}
