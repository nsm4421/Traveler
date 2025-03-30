import 'package:freezed_annotation/freezed_annotation.dart';

import '../../comment/abs_create_comment.model.dart';

part 'create_comment.model.freezed.dart';

part 'create_comment.model.g.dart';

// ignore_for_file: annotate_overrides
// ignore_for_file: non_constant_identifier_names
@freezed
@JsonSerializable()
class CreateTripPlanCommentModel extends AbsCreateCommentModel
    with _$CreateTripPlanCommentModel {
  final String trip_plan_id;
  final String? parent_id;

  CreateTripPlanCommentModel(
      {super.content = '', required this.trip_plan_id, this.parent_id})
      : super(ref_id: trip_plan_id);

  factory CreateTripPlanCommentModel.fromJson(Map<String, dynamic> json) =>
      _$CreateTripPlanCommentModelFromJson(json);

  Map<String, Object?> toJson() => _$CreateTripPlanCommentModelToJson(this);
}
