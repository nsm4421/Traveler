import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create.freezed.dart';

part 'create.g.dart';

@freezed
class CreateJourneyModel with _$CreateJourneyModel {
  const factory CreateJourneyModel({
    required String content,
    required String country_code,
    required String start,
    required String end,
  }) = _CreateJourneyModel;

  factory CreateJourneyModel.fromJson(Map<String, dynamic> json) =>
      _$CreateJourneyModelFromJson(json);
}
