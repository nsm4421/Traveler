import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_trip_plan.model.freezed.dart';

part 'edit_trip_plan.model.g.dart';

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
