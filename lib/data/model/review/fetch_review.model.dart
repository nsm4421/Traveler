import 'package:freezed_annotation/freezed_annotation.dart';
import '../base.model.dart';

import '../user/creator.model.dart';

part 'fetch_review.model.freezed.dart';

part 'fetch_review.model.g.dart';

// ignore_for_file: annotate_overrides
// ignore_for_file: non_constant_identifier_names
@freezed
@JsonSerializable()
class FetchReviewModel extends BaseModel with _$FetchReviewModel {
  final String? title;
  final String content;
  final List<String> images;

  FetchReviewModel({
    required super.id,
    required super.created_at,
    required super.creator,
    required super.removed_at,
    this.title,
    this.content = '',
    required this.images,
  });

  factory FetchReviewModel.fromJson(Map<String, dynamic> json) =>
      _$FetchReviewModelFromJson(json);
}
