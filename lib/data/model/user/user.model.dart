import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:module/shared/shared.export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user.model.freezed.dart';

part 'user.model.g.dart';

@freezed
class CreatorModel with _$CreatorModel {
  const factory CreatorModel({
    required String id,
    required String username,
    String? sex,
    String? born_at,
  }) = _CreatorModel;

  factory CreatorModel.fromJson(Map<String, dynamic> json) =>
      _$CreatorModelFromJson(json);
}

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    required UserMetaData userMetadata,
    required String created_at,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.from(User user) => UserModel(
      id: user.id,
      email: user.email!,
      userMetadata: UserMetaData.fromJson(user!.userMetadata!),
      created_at: user.createdAt);
}

@freezed
class UserMetaData with _$UserMetaData {
  const factory UserMetaData({
    @Default('') String username,
    @Default('') String description,
    @Default(Sex.male) Sex sex,
    @Default('') String born_at,
  }) = _UserMetaData;

  factory UserMetaData.fromJson(Map<String, dynamic> json) =>
      _$UserMetaDataFromJson(json);
}
