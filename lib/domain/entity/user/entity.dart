import 'package:module/data/model/export.dart';
import 'package:module/shared/shared.export.dart';

class UserEntity extends BaseEntity {
  final String username;
  final String description;
  final Sex sex;
  final DateTime bornAt;

  UserEntity(
      {required super.id,
      super.createdAt,
      required this.username,
      required this.description,
      required this.sex,
      required this.bornAt});

  factory UserEntity.from(UserModel model) => UserEntity(
      id: model.id,
      createdAt: DateTime.tryParse(model.created_at),
      username: model.username,
      description: model.description,
      sex: model.sex,
      bornAt: DateTime.parse(model.born_at));
}
