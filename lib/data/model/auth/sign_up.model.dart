import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:module/shared/shared.export.dart';

part 'sign_up.model.freezed.dart';

part 'sign_up.model.g.dart';

// ignore_for_file: annotate_overrides
// ignore_for_file: non_constant_identifier_names
@freezed
@JsonSerializable()
class SignUpRequestModel with _$SignUpRequestModel {
  final String email;
  final String password;
  final RawUserMetaDataModel data;

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);

  SignUpRequestModel(
      {required this.email, required this.password, required this.data});

  Map<String, Object?> toJson() => _$SignUpRequestModelToJson(this);
}

@freezed
@JsonSerializable()
class RawUserMetaDataModel with _$RawUserMetaDataModel {
  final String username;
  final String description;
  final Sex sex;
  final DateTime born_at;

  RawUserMetaDataModel({
    this.username = '',
    this.description = '',
    this.sex = Sex.male,
    required this.born_at,
  });

  factory RawUserMetaDataModel.fromJson(Map<String, dynamic> json) =>
      _$RawUserMetaDataModelFromJson(json);

  Map<String, Object?> toJson() => _$RawUserMetaDataModelToJson(this);
}
