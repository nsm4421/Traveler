import 'package:module/domain/entity/apply/entity.dart';

abstract interface class ApplyRepository {
  Future<void> create({
    required String planId,
    required String content,
  });

  Future<List<ApplyEntity>> fetch();

  Future<void> modify({
    required String id,
    required String planId,
    required String content,
  });

  Future<void> delete(String id);
}
