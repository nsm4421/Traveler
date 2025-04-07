import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:module/shared/shared.export.dart';

part 'edit_profile.model.freezed.dart';

part 'edit_profile.model.g.dart';

// ignore_for_file: annotate_overrides
// ignore_for_file: non_constant_identifier_names
@freezed
@JsonSerializable()
class EditProfileModel with _$EditProfileModel {
  final String? description;
  final Sex? sex;
  final DateTime? born_at;
  final String? profile_image;

  factory EditProfileModel.fromJson(Map<String, dynamic> json) =>
      _$EditProfileModelFromJson(json);

  EditProfileModel(
      {this.description, this.sex, this.born_at, this.profile_image});

  Map<String, Object?> toJson() => _$EditProfileModelToJson(this);
}
