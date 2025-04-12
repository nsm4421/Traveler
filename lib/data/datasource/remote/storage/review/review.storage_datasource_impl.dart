import 'dart:io';

import 'package:http_parser/http_parser.dart';
import 'package:module/shared/shared.export.dart';
import 'package:uuid/uuid.dart';

import '../abs_storage_datasource_impl.dart';

part 'review.storage_datasource.dart';

class ReviewStorageDataSourceImpl extends BaseStorageDataSourceImpl
    implements ReviewStorageDataSource {
  ReviewStorageDataSourceImpl({required super.storage, required super.logger})
      : super(bucketName: Buckets.review.name);

  @override
  Future<List<String>> uploadImages({
    required String uid,
    required List<File> images,
    void Function(double progress)? onProgress,
  }) async {
    final futures = List.generate(images.length, (index) async {
      final file = images[index];
      final pathInBucket = '$uid/${const Uuid().v4()}.jpg';
      await super.uploadFile(file: file, pathInBucket: pathInBucket);
      if (onProgress != null) {
        onProgress((index + 1) / (images.length));
      }
      return super.getPublicUrl(pathInBucket);
    });
    return await Future.wait(futures);
  }
}
