import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update.freezed.dart';

part 'update.g.dart';

@freezed
class ModifyJourneyModel with _$ModifyJourneyModel {
  const factory ModifyJourneyModel({
    required String id,
    required String content,
    required String country_code,
    required String start,
    required String end,
  }) = _ModifyJourneyModel;

  factory ModifyJourneyModel.fromJson(Map<String, dynamic> json) =>
      _$ModifyJourneyModelFromJson(json);
}
