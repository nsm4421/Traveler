import 'package:freezed_annotation/freezed_annotation.dart';

import '../../comment/abs_create_comment.model.dart';

part 'create_comment.model.freezed.dart';

part 'create_comment.model.g.dart';

// ignore_for_file: annotate_overrides
// ignore_for_file: non_constant_identifier_names
@freezed
@JsonSerializable()
class CreateReviewCommentModel extends AbsCreateCommentModel
    with _$CreateReviewCommentModel {
  final String review_id;
  final String? parent_id;

  CreateReviewCommentModel(
      {super.content = '', required this.review_id, this.parent_id})
      : super(ref_id: review_id);

  factory CreateReviewCommentModel.fromJson(Map<String, dynamic> json) =>
      _$CreateReviewCommentModelFromJson(json);

  Map<String, Object?> toJson() => _$CreateReviewCommentModelToJson(this);
}
