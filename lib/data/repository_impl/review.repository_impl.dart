import 'package:injectable/injectable.dart';
import 'package:module/data/datasource/export.dart';
import 'package:module/data/model/export.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

@LazySingleton(as: ReviewRepository)
class ReviewRepositoryImpl with LoggerMixIn implements ReviewRepository {
  final LocalStorageDataSource _localStorageDataSource;
  final RemoteReviewDataSource _remoteReviewDataSource;

  ReviewRepositoryImpl(
      {required LocalStorageDataSource localStorageDataSource,
      required RemoteReviewDataSource remoteReviewDataSource})
      : _localStorageDataSource = localStorageDataSource,
        _remoteReviewDataSource = remoteReviewDataSource;

  @override
  Future<void> create(
      {required String content, required List<String> images}) async {
    return _remoteReviewDataSource
        .create(CreateReviewModel(content: content, images: images));
  }

  @override
  Future<void> softDelete(String id) async {
    return _remoteReviewDataSource.softDelete(id);
  }

  @override
  Future<List<ReviewEntity>> fetch({DateTime? cursor, int limit = 20}) async {
    return _remoteReviewDataSource
        .fetch(cursor: cursor, limit: limit)
        .then((res) => res.map(ReviewEntity.fromModel).toList());
  }

  @override
  Future<ReviewEntity> findById(String id) async {
    return _remoteReviewDataSource.findById(id).then(ReviewEntity.fromModel);
  }
}
