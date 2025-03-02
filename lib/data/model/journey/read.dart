import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'read.freezed.dart';

part 'read.g.dart';

@freezed
class JourneyModel with _$JourneyModel {
  const factory JourneyModel(
      {required String id,
      required String content,
      required String country_code,
      required String start,
      required String end,
      required String created_at}) = _JourneyModel;

  factory JourneyModel.fromJson(Map<String, dynamic> json) =>
      _$JourneyModelFromJson(json);
}
