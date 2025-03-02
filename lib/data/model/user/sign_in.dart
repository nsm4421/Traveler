import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in.freezed.dart';

part 'sign_in.g.dart';

@freezed
class SignInRequestModel with _$SignInRequestModel {
  const factory SignInRequestModel({
    required String username,
    required String password,
  }) = _SignInRequestModel;

  factory SignInRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestModelFromJson(json);
}
