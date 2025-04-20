import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_review.model.freezed.dart';

part 'edit_review.model.g.dart';

// ignore_for_file: annotate_overrides
// ignore_for_file: non_constant_identifier_names
@freezed
@JsonSerializable()
class CreateReviewModel with _$CreateReviewModel {
  final String country_code;
  final String? title;
  final List<String> images;
  final List<String> captions;
  final List<String> hashtags;
  final String content;

  CreateReviewModel(
      {required this.country_code,
      this.title,
      required this.images,
      required this.captions,
      this.content = '',
      required this.hashtags});

  Map<String, Object?> toJson() => _$CreateReviewModelToJson(this);
}
