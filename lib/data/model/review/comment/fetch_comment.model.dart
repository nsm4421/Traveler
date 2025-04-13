import 'package:freezed_annotation/freezed_annotation.dart';

import '../../comment/abs_comment.model.dart';

import '../../user/creator.model.dart';

part 'fetch_comment.model.freezed.dart';

part 'fetch_comment.model.g.dart';

// ignore_for_file: annotate_overrides
// ignore_for_file: non_constant_identifier_names
@freezed
@JsonSerializable()
class ReviewCommentModel extends AbsCommentModel with _$ReviewCommentModel {
  final String review_id;

  ReviewCommentModel({
    required this.review_id,
    super.parent_comment_id,
    required super.id,
    super.content,
    required super.creator,
    required super.created_at,
    super.removed_at,
  }) : super(ref_id: review_id);

  factory ReviewCommentModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewCommentModelFromJson(json);
}
