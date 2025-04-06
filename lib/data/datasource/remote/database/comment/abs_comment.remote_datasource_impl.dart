import 'package:logger/logger.dart';
import 'package:module/data/model/export.dart';
import 'package:module/shared/shared.export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'abs_comment.remote_datasource.dart';

abstract class AbsRemoteCommentDataSourceImpl<T extends AbsCommentModel>
    with UtcMixIn
    implements AbsRemoteCommentDataSource<T> {
  /// 참조하고 있는 대상 id 컬럼명
  /// 예를 들어 여행계획에 댓글을 단다고 하면 ref_id는 여행계획 테이블의 id
  /// trip_plan_comment 테이블을 만들 때 trip_plan_id 컬럼을 만든다면, refIdKey는 trip_plan_id라는 문자열로 등록
  final String _refIdKey;
  final PostgrestQueryBuilder _queryBuilder;
  final Logger _logger;

  AbsRemoteCommentDataSourceImpl(
      {required String refIdKey,
      required PostgrestQueryBuilder queryBuilder,
      required Logger logger})
      : _refIdKey = refIdKey,
        _queryBuilder = queryBuilder,
        _logger = logger;

  T fromJson(Map<String, dynamic> json);

  @override
  Future<T> create(
      {required String refId,
      String? parentCommentId,
      required String content}) async {
    final data = {
      _refIdKey: refId,
      if (parentCommentId != null) 'parent_comment_id': parentCommentId,
      'content': content
    };
    return await _queryBuilder
        .insert(data)
        .select("*, creator:${Tables.users.name}(id, username, sex, born_at)")
        .then((res) => fromJson(res.first));
  }

  @override
  Future<Iterable<T>> fetchParents(
      {required String refId, DateTime? cursor, int limit = 20}) async {
    return await _queryBuilder
        .select("*, creator:${Tables.users.name}(id, username, sex, born_at)")
        .eq(_refIdKey, refId)
        .lt('created_at', cursor ?? nowDt)
        .filter('removed_at', 'is', null)
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
        .filter('removed_at', 'is', null)
        .lt('created_at', cursor?? nowDt)
        .order('created_at', ascending: false)
        .limit(limit)
        .then((res) => res.map((fromJson)));
  }

  @override
  Future<void> softDelete(String commentId, {String? content}) async {
    return await _queryBuilder.update({
      'content': content ?? '삭제된 댓글입니다',
      'updated_at': nowDt,
      'removed_at': nowDt
    }).eq("id", commentId);
    ;
  }
}
