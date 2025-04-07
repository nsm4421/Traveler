import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in.model.freezed.dart';

part 'sign_in.model.g.dart';

// ignore_for_file: annotate_overrides
// ignore_for_file: non_constant_identifier_names
@freezed
@JsonSerializable()
class SignInResponseModel with _$SignInResponseModel {
  final String refreshToken;
  final String accessToken;

  SignInResponseModel({required this.refreshToken, required this.accessToken});

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseModelFromJson(json);
}
