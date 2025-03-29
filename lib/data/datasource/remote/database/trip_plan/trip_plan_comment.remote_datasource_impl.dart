import '../comment/abs_comment.remote_datasource_impl.dart';

part 'trip_plan_comment.remote_datasource.dart';

class RemoteTripPlanCommentDataSourceImpl extends AbsRemoteCommentDataSourceImpl
    implements RemoteTripPlanCommentDataSource {
  RemoteTripPlanCommentDataSourceImpl(
      {required super.queryBuilder, required super.logger});
}
