import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:module/shared/shared.export.dart';

part 'edit_trip_plan.model.freezed.dart';

part 'edit_trip_plan.model.g.dart';

// ignore_for_file: annotate_overrides
// ignore_for_file: non_constant_identifier_names
@freezed
@JsonSerializable()
class EditTripPlanModel with _$EditTripPlanModel {
  final String title;
  final String content;
  final int min_head_count;
  final int max_head_count;
  late final List<String> hashtags;
  late final String country_code;
  final String start_date;
  final String end_date;

  EditTripPlanModel({
    this.title = '',
    this.content = '',
    this.min_head_count = 2,
    this.max_head_count = 8,
    List<String>? hashtags,
    String? country_code,
    required this.start_date,
    required this.end_date,
  }) {
    this.hashtags = hashtags ?? [];
    this.country_code = country_code ?? Country.korea.code;
  }

  factory EditTripPlanModel.fromJson(Map<String, dynamic> json) =>
      _$EditTripPlanModelFromJson(json);

  Map<String, Object?> toJson() => _$EditTripPlanModelToJson(this);
}
