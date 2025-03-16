import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user/user.model.dart';

part 'fetch_join_apply.model.freezed.dart';

part 'fetch_join_apply.model.g.dart';

@freezed
class FetchJoinApplyModel with _$FetchJoinApplyModel {
  const factory FetchJoinApplyModel({
    @Default('') String id,
    @Default('') String trip_plan_id,
    @Default('') String content,
    @Default(false) bool is_accepted,
    required CreatorModel creator,
    @Default('') created_at,
  }) = _FetchJoinApplyModel;

  factory FetchJoinApplyModel.fromJson(Map<String, dynamic> json) =>
      _$FetchJoinApplyModelFromJson(json);
}
