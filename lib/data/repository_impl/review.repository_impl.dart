import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:module/data/datasource/export.dart';
import 'package:module/data/model/export.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/shared/shared.export.dart';

@LazySingleton(as: ReviewRepository)
class ReviewRepositoryImpl with LoggerMixIn implements ReviewRepository {
  final LocalStorageDataSource _localStorageDataSource;
  final RemoteAuthDataSource _remoteAuthDataSource;
  final RemoteReviewDataSource _remoteReviewDataSource;
  final ReviewStorageDataSource _reviewStorageDataSource;

  ReviewRepositoryImpl(
      {required LocalStorageDataSource localStorageDataSource,
      required RemoteAuthDataSource remoteAuthDataSource,
      required RemoteReviewDataSource remoteReviewDataSource,
      required ReviewStorageDataSource reviewStorageDataSource})
      : _localStorageDataSource = localStorageDataSource,
        _remoteAuthDataSource = remoteAuthDataSource,
        _remoteReviewDataSource = remoteReviewDataSource,
        _reviewStorageDataSource = reviewStorageDataSource;

  @override
  Future<void> create({
    required String country_code,
    String? title,
    required String content,
    required List<String> captions,
    required List<File> imageFiles,
    required List<String> hashtags,
  }) async {
    final imageUrls = imageFiles.isEmpty
        ? <String>[]
        : await _reviewStorageDataSource.uploadImages(
            uid: _remoteAuthDataSource.currentUid, images: imageFiles);
    return await _remoteReviewDataSource.create(CreateReviewModel(
        country_code: country_code,
        content: content,
        images: imageUrls,
        captions: captions,
        hashtags: hashtags));
  }

  @override
  Future<void> delete(String id) async {
    return await _remoteReviewDataSource.delete(id);
  }

  @override
  Future<List<ReviewEntity>> fetch({DateTime? cursor, int limit = 20}) async {
    return await _remoteReviewDataSource
        .fetch(cursor: cursor, limit: limit)
        .then((res) => res.map(ReviewEntity.fromModel).toList());
  }

  @override
  Future<ReviewEntity> findById(String id) async {
    return await _remoteReviewDataSource
        .findById(id)
        .then(ReviewEntity.fromModel);
  }
}
