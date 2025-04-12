import 'dart:io';

import 'package:http_parser/http_parser.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mime/mime.dart';

import 'package:module/shared/shared.export.dart';

part 'abs_storage_datasource.dart';

class BaseStorageDataSourceImpl
    with LoggerMixIn
    implements AbsStorageDataSource {
  final StorageFileApi _storage;
  final String _bucketName;
  final Logger _logger;

  BaseStorageDataSourceImpl(
      {required StorageFileApi storage,
      required String bucketName,
      required Logger logger})
      : _storage = storage,
        _bucketName = bucketName,
        _logger = logger;

  @override
  Future<void> uploadFile(
      {required File file,
      required String pathInBucket,
      bool upsert = false}) async {
    await _storage.upload(pathInBucket, file,
        fileOptions: FileOptions(cacheControl: '3600', upsert: upsert));
  }

  @override
  String getPublicUrl(String pathInBucket) {
    return _storage.getPublicUrl(pathInBucket);
  }

  @override
  Future<String> getSignedUrl(
      {required String pathInBucket, int expiresInSec = 60}) async {
    return await _storage.createSignedUrl(pathInBucket, expiresInSec);
  }
}
