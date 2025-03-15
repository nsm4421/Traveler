import 'package:module/data/model/export.dart';
import 'package:module/shared/shared.export.dart';

class CreatorEntity {
  final String id;
  final String username;

  // nullable fields
  final Sex? sex;
  final DateTime? bornAt;

  CreatorEntity({
    required this.id,
    required this.username,
    this.sex,
    this.bornAt,
  });

  factory CreatorEntity.from(CreatorModel model) => CreatorEntity(
      id: model.id,
      username: model.username,
      sex: model.sex == null
          ? null
          : Sex.values.firstWhere((item) => item.name == model.sex),
      bornAt: model.born_at == null ? null : DateTime.tryParse(model.born_at!));
}
