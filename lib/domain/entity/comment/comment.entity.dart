import 'package:module/data/model/export.dart';

import '../base/base.entity.dart';
import '../user/creator.dart';

part 'parent_comment.entity.dart';

part 'child_comment.entity.dart';

abstract class CommentEntity extends BaseEntity {
  final String refId;
  final String? parentId;
  late final String content;
  final DateTime? removedAt;

  CommentEntity({
    required super.id,
    super.createdAt,
    required super.creator,
    required this.refId,
    this.parentId,
    required this.content,
    this.removedAt,
  });
}
