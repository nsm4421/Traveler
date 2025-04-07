import 'dart:io';

import 'package:http_parser/http_parser.dart';
import 'package:module/shared/shared.export.dart';

import '../base/abs_storage_datasource_impl.dart';

part 'auth.storage_datasource.dart';

class AuthStorageDataSourceImpl extends BaseStorageDataSourceImpl
    implements AuthStorageDataSource {
  AuthStorageDataSourceImpl(
      {required super.storage, required super.dio, required super.logger})
      : super(bucketName: Buckets.review.name);

  @override
  Future<String> uploadProfileImage({
    required String filename,
    required File profileImage,
    bool upsert = false,
    void Function(double progress)? onProgress,
  }) async {
    final pathInBucket = 'image/$filename.jpg';
    await super.uploadFile(
        file: profileImage,
        pathInBucket: pathInBucket,
        upsert: upsert,
        defaultMediaType: MediaType('image', 'jpeg'),
        onProgress: onProgress);
    return super.getPublicUrl(pathInBucket);
  }
}
