import 'package:module/data/model/export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../comment/abs_comment.remote_datasource_impl.dart';

part 'review_comment.remote_datasource.dart';

class RemoteReviewCommentDataSourceImpl
    extends AbsRemoteCommentDataSourceImpl<ReviewCommentModel>
    implements RemoteReviewCommentDataSource {
  final PostgrestQueryBuilder _queryBuilder;

  RemoteReviewCommentDataSourceImpl(
      {required super.queryBuilder, required super.logger})
      : _queryBuilder = queryBuilder,
        super(refIdKey: 'review_id');

  @override
  ReviewCommentModel fromJson(Map<String, dynamic> json) =>
      ReviewCommentModel.fromJson(json);
}
