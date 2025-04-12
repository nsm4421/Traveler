import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:module/shared/shared.export.dart';

import '../user/creator.model.dart';

part 'fetch_trip_plan.model.freezed.dart';

part 'fetch_trip_plan.model.g.dart';

// ignore_for_file: annotate_overrides
// ignore_for_file: non_constant_identifier_names
@freezed
@JsonSerializable()
class FetchTripPlanModel with _$FetchTripPlanModel {
  final String id;
  final String title;
  final String content;
  final int min_head_count;
  final int max_head_count;
  late final List<String> hashtags;
  late final country_code;
  final start_date;
  final end_date;
  final CreatorModel creator;
  final created_at;

  FetchTripPlanModel({
    required this.id,
    required this.title,
    required this.content,
    this.min_head_count = 2,
    this.max_head_count = 8,
    List<String>? hashtags,
    String? country_code,
    required this.start_date,
    required this.end_date,
    required this.creator,
    required this.created_at,
  }) {
    this.hashtags = hashtags ?? [];
    this.country_code = country_code ?? Country.korea.code;
  }

  factory FetchTripPlanModel.fromJson(Map<String, dynamic> json) =>
      _$FetchTripPlanModelFromJson(json);
}
