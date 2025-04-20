import 'dart:io';

import 'package:module/domain/entity/export.dart';

abstract interface class ReviewRepository {
  Future<void> create({
    required String country_code,
    String? title,
    required String content,
    required List<String> captions,
    required List<File> imageFiles,
    required List<String> hashtags,
  });

  Future<List<ReviewEntity>> fetch({DateTime? cursor, int limit = 20});

  Future<ReviewEntity> findById(String id);

  Future<void> delete(String id);
}
