import 'dart:io';

import 'package:http_parser/http_parser.dart';
import 'package:logger/logger.dart';
import 'package:module/shared/shared.export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'avatar.storage_datasource.dart';

class AvatarStorageDataSourceImpl implements AvatarStorageDataSource {
  final StorageFileApi _storage;
  final Logger _logger;

  AvatarStorageDataSourceImpl(
      {required StorageFileApi storage, required Logger logger})
      : _storage = storage,
        _logger = logger;

  @override
  Future<String> uploadProfileImage(
      {required String uid,
      required File profileImage,
      bool upsert = true}) async {
    final pathInBucket = '$uid/avatar.jpg';
    await _storage.upload(pathInBucket, profileImage,
        fileOptions: FileOptions(contentType: 'image/jpg', upsert: upsert));
    return _storage.getPublicUrl(pathInBucket);
  }
}
