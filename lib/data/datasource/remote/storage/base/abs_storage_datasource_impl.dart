import 'dart:io';

// MultipartFile class를 Dio, Http라이브러리에서 같은 클래스명으로 사용하고 있음
import 'package:dio/dio.dart' as dio;
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
  final dio.Dio _dio;
  final Logger _logger;

  BaseStorageDataSourceImpl(
      {required StorageFileApi storage,
      required String bucketName,
      required dio.Dio dio,
      required Logger logger})
      : _storage = storage,
        _bucketName = bucketName,
        _dio = dio,
        _logger = logger;

  @override
  Future<void> uploadFile({
    required File file,
    MediaType? defaultMediaType,
    required String pathInBucket,
    bool upsert = false,
    void Function(double progress)? onProgress,
  }) async {
    final mimeType = lookupMimeType(file.path);
    final contentType =
        mimeType == null ? defaultMediaType : MediaType.parse(mimeType);
    final formData = dio.FormData.fromMap({
      'file': await dio.MultipartFile.fromFile(file.path,
          filename: pathInBucket.split('/').last, contentType: contentType),
    });
    final res = await _dio.post(
      '${Env.supabaseUrl}/storage/v1/object/$_bucketName$pathInBucket',
      data: formData,
      options: dio.Options(contentType: 'multipart/form-data', headers: {
        ..._dio.options.headers,
        'x-upsert': upsert ? 'true' : 'false',
      }),
      onSendProgress: (sent, total) {
        if (onProgress == null || total == 0) {
          return;
        }
        final progress = sent / total;
        onProgress(progress);
      },
    );
    if (res.statusCode == 200 || res.statusCode == 201) {
      _logger.t([LogTags.dataSource, 'upload file success']);
    } else {
      _logger.e([
        LogTags.dataSource,
        'upload file fail|status code:${res.statusCode}}data:${res.data}'
      ]);
      throw StorageException('upload file fail|path:$pathInBucket');
    }
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
