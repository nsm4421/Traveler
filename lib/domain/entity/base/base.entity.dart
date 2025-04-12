import '../user/creator.entity.dart';

abstract class BaseEntity {
  final String id;
  final DateTime? createdAt;
  final DateTime? removedAt;
  final CreatorEntity creator;

  BaseEntity(
      {required this.id,
      this.createdAt,
      this.removedAt,
      required this.creator});
}
