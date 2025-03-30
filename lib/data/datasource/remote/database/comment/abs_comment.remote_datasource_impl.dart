import 'package:logger/logger.dart';
import 'package:module/data/model/export.dart';
import 'package:module/shared/shared.export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'abs_comment.remote_datasource.dart';

abstract class AbsRemoteCommentDataSourceImpl<T extends AbsCommentModel>
    implements AbsRemoteCommentDataSource<T> {
  final PostgrestQueryBuilder _queryBuilder;
  final Logger _logger;

  AbsRemoteCommentDataSourceImpl(
      {required PostgrestQueryBuilder queryBuilder, required Logger logger})
      : _queryBuilder = queryBuilder,
        _logger = logger;

  String get _now => DateTime.now().toUtc().toIso8601String();

  T fromJson(Map<String, dynamic> json);

  @override
  Future<void> create(
      {required String refId,
      String? parentCommentId,
      required String content}) async {
    final data = {
      'ref_id': refId,
      if (parentCommentId != null) 'parent_comment_id': parentCommentId,
      'content': content
    };
    _logger.t([LogTags.dataSource, data.toString()]);
    return await _queryBuilder.insert(data);
  }

  @override
  Future<Iterable<T>> fetchParents(
      {required String refId, DateTime? cursor, int limit = 20}) async {
    return await _queryBuilder
        .select("*, creator:${Tables.users.name}(id, username, sex, born_at)")
        .eq("ref_id", refId)
        .lt('created_at', (cursor ?? _now))
        .order('created_at', ascending: false)
        .limit(limit)
        .then((res) => res.map((fromJson)));
  }

  @override
  Future<Iterable<T>> fetchChildren({
    required String parentCommentId,
    DateTime? cursor,
    int limit = 20,
  }) async {
    return await _queryBuilder
        .select("*, creator:${Tables.users.name}(id, username, sex, born_at)")
        .eq("parent_comment_id", parentCommentId)
        .lt('created_at', (cursor ?? _now))
        .order('created_at', ascending: false)
        .limit(limit)
        .then((res) => res.map((fromJson)));
  }

  @override
  Future<void> softDelete(String commentId) async {
    return await _queryBuilder.update({'removed_at': _now}).eq("id", commentId);
    ;
  }
}
