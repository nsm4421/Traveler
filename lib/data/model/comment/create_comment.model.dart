import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_comment.model.freezed.dart';

part 'create_comment.model.g.dart';

@freezed
class CreateParentCommentModel with _$CreateParentCommentModel {
  const factory CreateParentCommentModel({
    @Default('') String ref_id,
    @Default('') String content,
  }) = _CreateParentCommentModel;

  factory CreateParentCommentModel.fromJson(Map<String, dynamic> json) =>
      _$CreateParentCommentModelFromJson(json);
}

@freezed
class CreateChildCommentModel with _$CreateChildCommentModel {
  const factory CreateChildCommentModel({
    @Default('') String ref_id,
    @Default('') String parentId,
    @Default('') String content,
  }) = _CreateChildCommentModel;

  factory CreateChildCommentModel.fromJson(Map<String, dynamic> json) =>
      _$CreateChildCommentModelFromJson(json);
}
