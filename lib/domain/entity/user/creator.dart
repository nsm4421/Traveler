import 'package:module/data/model/export.dart';

class CreatorEntity {
  final String id;
  final String username;

  CreatorEntity({
    required this.id,
    required this.username,
  });

  factory CreatorEntity.from(CreatorModel model) => CreatorEntity(
        id: model.id,
        username: model.username,
      );
}
