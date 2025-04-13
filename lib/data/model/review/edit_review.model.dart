import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_review.model.freezed.dart';

part 'edit_review.model.g.dart';

// ignore_for_file: annotate_overrides
// ignore_for_file: non_constant_identifier_names
@freezed
@JsonSerializable()
class CreateReviewModel with _$CreateReviewModel {
  final String? title;
  final List<String> images;
  final List<String> captions;
  final String content;

  CreateReviewModel(
      {this.title,
      required this.images,
      required this.captions,
      this.content = ''});

  Map<String, Object?> toJson() => _$CreateReviewModelToJson(this);
}
