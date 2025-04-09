import 'dart:io';

import 'package:http_parser/http_parser.dart';
import 'package:logger/logger.dart';
import 'package:module/shared/shared.export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth.storage_datasource.dart';

class AuthStorageDataSourceImpl implements AuthStorageDataSource {
  final StorageFileApi _storage;
  final Logger _logger;

  AuthStorageDataSourceImpl(
      {required StorageFileApi storage, required Logger logger})
      : _storage = storage,
        _logger = logger;

  @override
  Future<String> uploadProfileImage(
      {required String filename,
      required File profileImage,
      bool upsert = false}) async {
    final pathInBucket = 'image/$filename.jpg';
    await _storage.upload(pathInBucket, profileImage,
        fileOptions: const FileOptions(contentType: 'image/jpg'));
    return _storage.getPublicUrl(pathInBucket);
  }
}
