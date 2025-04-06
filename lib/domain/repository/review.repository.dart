import 'package:module/domain/entity/export.dart';

abstract interface class ReviewRepository {
  Future<void> create({required String content, required List<String> images});

  Future<List<ReviewEntity>> fetch({DateTime? cursor, int limit = 20});

  Future<ReviewEntity> findById(String id);

  Future<void> softDelete(String id);
}
