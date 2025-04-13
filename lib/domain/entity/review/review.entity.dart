import 'package:module/data/model/export.dart';

import '../base/base.entity.dart';
import '../user/creator.entity.dart';

class ReviewEntity extends BaseEntity {
  final String? title;
  final String content;
  late final List<String> images;
  late final List<String?> captions;

  ReviewEntity(
      {required super.id,
      super.createdAt,
      super.removedAt,
      required super.creator,
      this.title,
      this.content = '',
      List<String?>? captions,
      List<String>? images}) {
    this.images = images ?? [];
    this.captions = captions ?? [];
  }

  factory ReviewEntity.fromModel(FetchReviewModel model) {
    return ReviewEntity(
      id: model.id,
      creator: CreatorEntity.from(model.creator),
      createdAt: DateTime.parse(model.created_at),
      removedAt: model.removed_at == null
          ? null
          : DateTime.tryParse(model.removed_at!),
      title: (model.title == null || model.title!.isEmpty) ? null : model.title,
      content: model.content,
      images: model.images,
      captions: model.captions
          .map((item) => (item == null || item.isEmpty) ? null : item)
          .toList(),
    );
  }
}
