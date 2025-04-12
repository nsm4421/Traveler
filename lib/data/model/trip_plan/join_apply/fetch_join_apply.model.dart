import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user/creator.model.dart';

part 'fetch_join_apply.model.freezed.dart';

part 'fetch_join_apply.model.g.dart';

// ignore_for_file: annotate_overrides
// ignore_for_file: non_constant_identifier_names
@freezed
@JsonSerializable()
class FetchJoinApplyModel with _$FetchJoinApplyModel {
  final String id;
  final String trip_plan_id;
  final String content;
  final bool is_accepted;
  final CreatorModel creator;
  final String created_at;

  FetchJoinApplyModel({
    required this.id,
    required this.trip_plan_id,
    this.content = '',
    this.is_accepted = false,
    required this.creator,
    required this.created_at,
  });

  factory FetchJoinApplyModel.fromJson(Map<String, dynamic> json) =>
      _$FetchJoinApplyModelFromJson(json);
}
