import 'package:uuid/uuid.dart';

abstract class BaseEntity {
  late final String id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? removedAt;
  final String? createdBy;
  final String? updatedBy;

  BaseEntity(
      {String? id,
      this.createdAt,
      this.updatedAt,
      this.removedAt,
      this.createdBy,
      this.updatedBy}) {
    this.id = id ?? const Uuid().v4();
  }

  BaseEntity copyWith();
}
