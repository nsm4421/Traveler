import 'package:injectable/injectable.dart';
import 'package:module/data/datasource/export.dart';
import 'package:module/data/model/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/shared/shared.export.dart';

import 'abs_comment.repository_impl.dart';

@LazySingleton(as: TripCommentCommentRepository)
class TripPlanCommentRepositoryImpl extends AbsCommentRepositoryImpl<
        TripPlanCommentModel, TripPlanCommentEntity>
    with LoggerMixIn
    implements TripCommentCommentRepository {
  final RemoteTripPlanCommentDataSource _remoteCommentDataSource;

  TripPlanCommentRepositoryImpl(this._remoteCommentDataSource)
      : super(_remoteCommentDataSource);

  @override
  TripPlanCommentEntity fromModel(TripPlanCommentModel model) {
    return TripPlanCommentEntity.from(model);
  }
}
