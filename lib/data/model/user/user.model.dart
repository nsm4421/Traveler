import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:module/shared/shared.export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user.model.freezed.dart';

part 'user.model.g.dart';

@freezed
@JsonSerializable()
class UserModel with _$UserModel {
  final String id;
  final String email;
  final UserMetaData userMetadata;
  final String? created_at;

  UserModel({
    required this.id,
    required this.email,
    required this.userMetadata,
    this.created_at,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.from(User user) => UserModel(
      id: user.id,
      email: user.email!,
      userMetadata: UserMetaData.fromJson(user.userMetadata ?? {}),
      created_at: user.createdAt);
}

@freezed
@JsonSerializable()
class UserMetaData with _$UserMetaData {
  const UserMetaData(
      {this.username,
      this.description,
      this.sex = Sex.male,
      this.born_at,
      this.avatar_url});

  final String? username;
  final String? description;
  final Sex? sex;
  final String? born_at;
  final String? avatar_url;

  factory UserMetaData.fromJson(Map<String, dynamic> json) =>
      _$UserMetaDataFromJson(json);
}
