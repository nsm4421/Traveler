import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create.freezed.dart';
part 'create.g.dart';


@freezed
class CreateApplyModel with _$CreateApplyModel {
  const factory CreateApplyModel(
      {required String plan_id,
        required String uid,
        required String content}) = _CreateApplyModel;

  factory CreateApplyModel.fromJson(Map<String, dynamic> json) =>
      _$CreateApplyModelFromJson(json);
}