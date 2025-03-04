import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:module/shared/shared.export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'model.freezed.dart';

part 'model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel(
      {required String id,
      required String username,
      required String description,
      required Sex sex,
      required String born_at,
      required String created_at}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.from(User user) => UserModel(
      id: user.id,
      username: user.userMetadata!['username'],
      description: user.userMetadata!['description'],
      sex: user.userMetadata!['sex'] == 'male' ? Sex.male : Sex.female,
      born_at: user.userMetadata!['born_at'],
      created_at: user.createdAt);
}
