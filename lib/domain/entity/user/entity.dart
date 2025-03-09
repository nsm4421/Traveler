import 'package:module/data/model/export.dart';
import 'package:module/shared/shared.export.dart';

import 'creator.dart';

class UserEntity extends CreatorEntity {
  final String email;
  final String description;
  final Sex sex;
  final DateTime bornAt;
  final DateTime? createdAt;

  UserEntity(
      {required super.id,
      required this.email,
      required super.username,
      required this.description,
      required this.sex,
      required this.bornAt,
      this.createdAt});

  factory UserEntity.from(UserModel model) => UserEntity(
        id: model.id,
        username: model.userMetadata.username,
        email: model.email,
        description: model.userMetadata.description,
        sex: model.userMetadata.sex,
        bornAt: DateTime.parse(model.userMetadata.born_at),
        createdAt: DateTime.parse(model.created_at),
      );
}
