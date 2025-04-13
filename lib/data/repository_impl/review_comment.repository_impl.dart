import 'package:injectable/injectable.dart';
import 'package:module/data/datasource/export.dart';
import 'package:module/data/model/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/shared/shared.export.dart';

import 'abs_comment.repository_impl.dart';

@LazySingleton(as: ReviewCommentRepository)
class ReviewCommentRepositoryImpl
    extends AbsCommentRepositoryImpl<ReviewCommentModel, ReviewCommentEntity>
    with LoggerMixIn
    implements ReviewCommentRepository {
  final RemoteReviewCommentDataSource _remoteCommentDataSource;

  ReviewCommentRepositoryImpl(this._remoteCommentDataSource)
      : super(_remoteCommentDataSource);

  @override
  ReviewCommentEntity fromModel(ReviewCommentModel model) {
    return ReviewCommentEntity.from(model);
  }
}
