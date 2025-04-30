abstract class BaseEntity {
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? removedAt;

  BaseEntity({this.id, this.createdAt, this.updatedAt, this.removedAt});

  BaseEntity copyWith();
}
