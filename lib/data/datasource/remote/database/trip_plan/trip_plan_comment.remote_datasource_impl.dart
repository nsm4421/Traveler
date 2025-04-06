import 'package:module/data/model/export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../comment/abs_comment.remote_datasource_impl.dart';

part 'trip_plan_comment.remote_datasource.dart';

class RemoteTripPlanCommentDataSourceImpl
    extends AbsRemoteCommentDataSourceImpl<TripPlanCommentModel>
    implements RemoteTripPlanCommentDataSource {
  final PostgrestQueryBuilder _queryBuilder;

  RemoteTripPlanCommentDataSourceImpl(
      {required super.queryBuilder, required super.logger})
      : _queryBuilder = queryBuilder,
        super(refIdKey: 'trip_plan_id');

  @override
  TripPlanCommentModel fromJson(Map<String, dynamic> json) =>
      TripPlanCommentModel.fromJson(json);
}
