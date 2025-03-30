// ignore_for_file: non_constant_identifier_names
abstract class AbsCreateCommentModel {
  final String ref_id;
  final String content;
  final String? parent_id;  // 부모댓글인 경우 Null

  AbsCreateCommentModel(
      {required this.ref_id, required this.content, this.parent_id});
}
