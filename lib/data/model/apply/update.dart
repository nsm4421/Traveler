import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update.freezed.dart';

part 'update.g.dart';

@freezed
class ModifyApplyModel with _$ModifyApplyModel {
  const factory ModifyApplyModel(
      {required String id,
      required String plan_id,
      required String uid,
      required String content}) = _ModifyApplyModel;

  factory ModifyApplyModel.fromJson(Map<String, dynamic> json) =>
      _$ModifyApplyModelFromJson(json);
}
