import 'package:freezed_annotation/freezed_annotation.dart';

import '../../comment/abs_comment.model.dart';

import '../../user/user.model.dart';

part 'fetch_comment.model.freezed.dart';

part 'fetch_comment.model.g.dart';

// ignore_for_file: annotate_overrides
// ignore_for_file: non_constant_identifier_names
@freezed
@JsonSerializable()
class TripPlanCommentModel extends AbsCommentModel with _$TripPlanCommentModel {
  final String trip_plan_id;

  TripPlanCommentModel({
    required this.trip_plan_id,
    super.parent_comment_id,
    required super.id,
    super.content,
    required super.creator,
    required super.created_at,
    super.removed_at,
  }) : super(ref_id: trip_plan_id);

  factory TripPlanCommentModel.fromJson(Map<String, dynamic> json) =>
      _$TripPlanCommentModelFromJson(json);
}
