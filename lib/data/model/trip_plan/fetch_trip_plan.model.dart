import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user.model.dart';

part 'fetch_trip_plan.model.freezed.dart';

part 'fetch_trip_plan.model.g.dart';

@freezed
class FetchTripPlanModel with _$FetchTripPlanModel {
  const factory FetchTripPlanModel({
    @Default('') String id,
    @Default('') title,
    @Default('') String content,
    @Default(2) int min_head_count,
    @Default(8) int max_head_count,
    @Default(<String>[]) List<String> hashtags,
    @Default('') country_code,
    @Default('') start_date,
    @Default('') end_date,
    required CreatorModel creator,
    @Default('') created_at,
  }) = _FetchTripPlanModel;

  factory FetchTripPlanModel.fromJson(Map<String, dynamic> json) =>
      _$FetchTripPlanModelFromJson(json);
}
