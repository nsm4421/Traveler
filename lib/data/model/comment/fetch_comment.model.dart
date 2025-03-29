import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user.model.dart';

part 'fetch_comment.model.freezed.dart';

part 'fetch_comment.model.g.dart';

@freezed
class FetchParentCommentModel with _$FetchParentCommentModel {
  const factory FetchParentCommentModel({
    @Default('') String id,
    @Default('') String ref_id,
    @Default('') String content,
    required CreatorModel creator,
    @Default('') created_at,
    String? removed_at,
  }) = _FetchParentCommentModel;

  factory FetchParentCommentModel.fromJson(Map<String, dynamic> json)
  =>_$FetchParentCommentModelFromJson(json);
  // {
  //   final parsed = _$FetchParentCommentModelFromJson(json);
  //   return parsed.copyWith(
  //       content: parsed.removed_at == null ? parsed.content : "삭제된 댓글입니다");
  // }
}

@freezed
class FetchChildCommentModel with _$FetchChildCommentModel {
  const factory FetchChildCommentModel({
    @Default('') String id,
    @Default('') parent_id,
    @Default('') String ref_id,
    @Default('') String content,
    required CreatorModel creator,
    @Default('') created_at,
    String? removed_at,
  }) = _FetchChildCommentModel;

  factory FetchChildCommentModel.fromJson(Map<String, dynamic> json)
  =>_$FetchChildCommentModelFromJson(json);
  // {
  //   final parsed = _$FetchChildCommentModelFromJson(json);
  //   return parsed.copyWith(
  //       content: parsed.removed_at == null ? parsed.content : "삭제된 댓글입니다");
  // }
}
