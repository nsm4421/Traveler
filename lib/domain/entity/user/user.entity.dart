import 'package:module/data/model/export.dart';

import 'creator.entity.dart';

class UserEntity extends CreatorEntity {
  final String? email;
  final String? description;
  final DateTime? createdAt;

  UserEntity({
    required super.id,
    this.email,
    required super.username,
    this.description,
    super.sex,
    super.bornAt,
    this.createdAt,
    super.avatarUrl,
  });

  factory UserEntity.from(UserModel model) => UserEntity(
      id: model.id,
      username: model.userMetadata.username!,
      email: model.email,
      description: model.userMetadata.description,
      sex: model.userMetadata.sex,
      bornAt: model.userMetadata.born_at == null
          ? null
          : DateTime.parse(model.userMetadata.born_at!),
      createdAt:
          model.created_at == null ? null : DateTime.parse(model.created_at!),
      avatarUrl: model.userMetadata.avatar_url);
}
