import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'read.freezed.dart';

part 'read.g.dart';

@freezed
class ApplyModel with _$ApplyModel {
  const factory ApplyModel(
      {required String id,
      required String plan_id,
      required String uid,
      required String content,
      required String created_at}) = _ApplyModel;

  factory ApplyModel.fromJson(Map<String, dynamic> json) =>
      _$ApplyModelFromJson(json);
}
