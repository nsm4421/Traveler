import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_join_apply.model.freezed.dart';
part 'create_join_apply.model.g.dart';

@freezed
class CreateJoinApplyModel with _$CreateJoinApplyModel {
  const factory CreateJoinApplyModel({
    @Default('') String trip_plan_id,
    @Default('') String content,
  }) = _CreateJoinApplyModel;

  factory CreateJoinApplyModel.fromJson(Map<String, dynamic> json) =>
      _$CreateJoinApplyModelFromJson(json);
}
