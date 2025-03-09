import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'creator.freezed.dart';

part 'creator.g.dart';

@freezed
class CreatorModel with _$CreatorModel {
  const factory CreatorModel({
    required String id,
    required String username,
  }) = _CreatorModel;

  factory CreatorModel.fromJson(Map<String, dynamic> json) =>
      _$CreatorModelFromJson(json);
}
