import '../user/user.model.dart';

// ignore_for_file: non_constant_identifier_names
abstract class AbsCommentModel {
  final String id;
  final String ref_id;
  final String? parent_comment_id; // 부모댓글인 경우 Null
  final String content;
  final CreatorModel creator;
  final String created_at;
  final String? removed_at;

  AbsCommentModel({
    required this.id,
    required this.ref_id,
    this.parent_comment_id,
    this.content = '',
    required this.creator,
    required this.created_at,
    this.removed_at,
  });
}
