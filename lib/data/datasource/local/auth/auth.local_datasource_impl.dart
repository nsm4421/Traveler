import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:module/shared/shared.export.dart';

part 'auth.local_datasource.dart';

class LocalStorageDataSourceImpl implements LocalStorageDataSource {
  final FlutterSecureStorage _storage;
  final Logger _logger;

  LocalStorageDataSourceImpl(
      {required FlutterSecureStorage storage, required Logger logger})
      : _storage = storage,
        _logger = logger;

  @override
  Future<void> delete(String key) async {
    _logger.d([LogTags.dataSource, 'delete key $key']);
    await _storage.delete(key: key);
  }

  @override
  Future<String?> read(String key) async {
    _logger.d([LogTags.dataSource, 'read key $key']);
    return await _storage.read(key: key);
  }

  @override
  Future<void> write(String key, String value) async {
    _logger.d([LogTags.dataSource, 'write key $key']);
    await _storage.write(key: key, value: value);
  }
}
