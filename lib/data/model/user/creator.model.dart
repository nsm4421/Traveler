import 'package:freezed_annotation/freezed_annotation.dart';

part 'creator.model.freezed.dart';

part 'creator.model.g.dart';

// ignore_for_file: annotate_overrides
// ignore_for_file: non_constant_identifier_names
@freezed
@JsonSerializable()
class CreatorModel with _$CreatorModel {
  final String id;
  final String username;
  final String? sex;
  final String? born_at;
  final String? avatar_url;

  CreatorModel(
      {required this.id,
      required this.username,
      required this.sex,
      required this.born_at,
      required this.avatar_url});

  factory CreatorModel.fromJson(Map<String, dynamic> json) =>
      _$CreatorModelFromJson(json);
}
