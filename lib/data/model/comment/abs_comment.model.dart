import '../base/base.model.dart';

// ignore_for_file: non_constant_identifier_names
abstract class AbsCommentModel extends BaseModel{
  final String ref_id;
  final String? parent_comment_id; // 부모댓글인 경우 Null
  final String content;

  AbsCommentModel({
    required super.id,
    required this.ref_id,
    this.parent_comment_id,
    this.content = '',
    required super.creator,
    required super.created_at,
    super.removed_at,
  });
}
