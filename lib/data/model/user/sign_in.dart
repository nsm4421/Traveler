import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in.freezed.dart';

part 'sign_in.g.dart';

@freezed
class SignInResponseModel with _$SignInResponseModel {
  const factory SignInResponseModel(
      {required String refreshToken,
        required String accessToken}) = _SignInResponseModel;

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseModelFromJson(json);
}
