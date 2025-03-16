import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:module/shared/shared.export.dart';

part 'sign_up.model.freezed.dart';

part 'sign_up.model.g.dart';

@freezed
class SignUpRequestModel with _$SignUpRequestModel {
  const factory SignUpRequestModel({
    required String email,
    required String password,
    required SignUpRequestData data
  }) = _SignUpRequestModel;

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);
}

@freezed
class SignUpRequestData with _$SignUpRequestData {
  const factory SignUpRequestData({
    required String username,
    required String description,
    required Sex sex,
    required DateTime born_at,
  }) = _SignUpRequestData;

  factory SignUpRequestData.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestDataFromJson(json);
}