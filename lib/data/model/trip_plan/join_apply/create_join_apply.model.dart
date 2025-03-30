import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_join_apply.model.freezed.dart';

part 'create_join_apply.model.g.dart';

// ignore_for_file: annotate_overrides
// ignore_for_file: non_constant_identifier_names
@freezed
@JsonSerializable()
class CreateJoinApplyModel with _$CreateJoinApplyModel {
  final String trip_plan_id;
  final String content;

  CreateJoinApplyModel({required this.trip_plan_id, required this.content});

  factory CreateJoinApplyModel.fromJson(Map<String, dynamic> json) =>
      _$CreateJoinApplyModelFromJson(json);
}
