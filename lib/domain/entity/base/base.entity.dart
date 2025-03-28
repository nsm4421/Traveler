import '../user/creator.dart';

abstract class BaseEntity {
  final String id;
  final DateTime? createdAt;
  final CreatorEntity creator;

  BaseEntity({required this.id, this.createdAt, required this.creator});
}
