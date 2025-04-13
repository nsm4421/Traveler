import 'dart:io';

import 'package:module/domain/entity/export.dart';

abstract interface class ReviewRepository {
  Future<void> create(
      {String? title,
      required List<String> captions,
      required String content,
      required List<File> imageFiles});

  Future<List<ReviewEntity>> fetch({DateTime? cursor, int limit = 20});

  Future<ReviewEntity> findById(String id);

  Future<void> delete(String id);
}
