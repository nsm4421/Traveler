import 'dart:io';

import 'package:http_parser/http_parser.dart';
import 'package:module/shared/shared.export.dart';
import 'package:uuid/uuid.dart';

import '../base/abs_storage_datasource_impl.dart';

part 'review.storage_datasource.dart';

class ReviewStorageDataSourceImpl extends BaseStorageDataSourceImpl
    implements ReviewStorageDataSource {
  ReviewStorageDataSourceImpl(
      {required super.storage, required super.dio, required super.logger})
      : super(bucketName: Buckets.review.name);

  @override
  Future<List<String>> uploadImages(List<File> images,
      {void Function(double progress)? onProgress}) async {
    final futures = images.map((file) async {
      final pathInBucket = 'image/${const Uuid().v4()}.jpg';
      await super.uploadFile(
          file: file,
          pathInBucket: pathInBucket,
          defaultMediaType: MediaType('image', 'jpeg'),
          onProgress: onProgress);
      return super.getPublicUrl(pathInBucket);
    });
    return await Future.wait(futures);
  }
}
