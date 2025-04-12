// ignore_for_file: non_constant_identifier_names
import 'user/creator.model.dart';

abstract class BaseModel {
  final String id;
  final CreatorModel creator;
  final String created_at;
  final String? removed_at;

  BaseModel({
    required this.id,
    required this.creator,
    required this.created_at,
    this.removed_at,
  });
}
