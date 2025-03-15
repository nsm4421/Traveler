import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/creator.dart';

part 'trip_plan.freezed.dart';

part 'trip_plan.g.dart';

@freezed
class FetchTripPlanModel with _$FetchTripPlanModel {
  const factory FetchTripPlanModel(
      {@Default('') String id,
      String? title,
      @Default('') String content,
      @Default(2) int min_head_count,
      @Default(8) int max_head_count,
      @Default(<String>[]) List<String> hashtags,
      @Default('') country_code,
      @Default('') start_date,
      @Default('') end_date,
      required CreatorModel creator}) = _FetchTripPlanModel;

  factory FetchTripPlanModel.fromJson(Map<String, dynamic> json) =>
      _$FetchTripPlanModelFromJson(json);
}

@freezed
class EditTripPlanModel with _$EditTripPlanModel {
  const factory EditTripPlanModel({
    @Default('') String title,
    @Default('') String content,
    @Default(2) int min_head_count,
    @Default(8) int max_head_count,
    @Default(<String>[]) List<String> hashtags,
    required String country_code,
    required String start_date,
    required String end_date,
  }) = _EditTripPlanModel;

  factory EditTripPlanModel.fromJson(Map<String, dynamic> json) =>
      _$EditTripPlanModelFromJson(json);
}
