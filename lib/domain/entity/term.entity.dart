import 'package:module/domain/entity/base.entity.dart';

/// 절 (節)
class SectionEntity extends BaseEntity {
  final int? index;
  final String? title;
  late final List<SubSectionEntity> subsections;

  SectionEntity(
      {super.id,
      super.createdAt,
      super.updatedAt,
      super.removedAt,
      this.index,
      this.title,
      List<SubSectionEntity>? subsections}) {
    this.subsections = subsections ?? [];
  }

  @override
  SectionEntity copyWith(
      {DateTime? createdAt,
      int? index,
      String? title,
      List<SubSectionEntity>? subsections}) {
    return SectionEntity(
        id: this.id,
        createdAt: createdAt ?? this.createdAt,
        index: index ?? this.index,
        title: title ?? this.title,
        subsections: subsections ?? this.subsections);
  }
}

/// 관 (款)
class SubSectionEntity extends BaseEntity {
  final int? index;
  final String title;
  late final List<ArticleEntity> articles;

  SubSectionEntity(
      {super.id,
      super.createdAt,
      super.updatedAt,
      super.removedAt,
      this.index,
      required this.title,
      List<ArticleEntity>? articles}) {
    this.articles = articles ?? [];
  }

  @override
  SubSectionEntity copyWith(
      {DateTime? createdAt,
      int? index,
      String? title,
      List<ArticleEntity>? articles}) {
    return SubSectionEntity(
        id: this.id,
        createdAt: createdAt ?? this.createdAt,
        index: index ?? this.index,
        title: title ?? this.title,
        articles: articles ?? this.articles);
  }
}

/// 조 (條)
class ArticleEntity extends BaseEntity {
  final int? index;
  final String title;
  final String? content;
  late final List<ParagraphEntity> paragraphs;

  ArticleEntity(
      {super.id,
      super.createdAt,
      super.updatedAt,
      super.removedAt,
      this.index,
      required this.title,
      this.content,
      List<ParagraphEntity>? paragraphs}) {
    this.paragraphs = paragraphs ?? [];
  }

  @override
  ArticleEntity copyWith(
      {DateTime? createdAt,
      int? index,
      String? title,
      List<ParagraphEntity>? paragraphs}) {
    return ArticleEntity(
        id: this.id,
        createdAt: createdAt ?? this.createdAt,
        index: index ?? this.index,
        title: title ?? this.title,
        content: content,
        paragraphs: paragraphs ?? this.paragraphs);
  }

  // content필드는 nullable이라서 copyWith를 따로 뺌
  ArticleEntity copyWithContent(String? content) {
    return ArticleEntity(
        id: id,
        createdAt: createdAt,
        index: index,
        title: title,
        content: content,
        paragraphs: paragraphs);
  }
}

/// 항 (項)
class ParagraphEntity extends BaseEntity {
  final int? index;
  final String content;
  late final List<SubparagraphEntity> subparagraphs;

  ParagraphEntity(
      {super.id,
      super.createdAt,
      super.updatedAt,
      super.removedAt,
      this.index,
      required this.content,
      List<SubparagraphEntity>? subparagraphs}) {
    this.subparagraphs = subparagraphs ?? [];
  }

  @override
  ParagraphEntity copyWith(
      {DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? removedAt,
      int? index,
      String? content,
      List<SubparagraphEntity>? subparagraphs}) {
    return ParagraphEntity(
        id: this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        removedAt: removedAt ?? this.removedAt,
        index: index ?? this.index,
        content: content ?? this.content,
        subparagraphs: subparagraphs ?? this.subparagraphs);
  }
}

/// 호 (號)
class SubparagraphEntity extends BaseEntity {
  final int? index;
  final String content;
  late final List<ItemEntity> items;

  SubparagraphEntity(
      {super.id,
      super.createdAt,
      super.updatedAt,
      super.removedAt,
      this.index,
      required this.content,
      List<ItemEntity>? items}) {
    this.items = items ?? [];
  }

  @override
  SubparagraphEntity copyWith(
      {DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? removedAt,
      int? index,
      String? content,
      List<ItemEntity>? items}) {
    return SubparagraphEntity(
        id: this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        removedAt: removedAt ?? this.removedAt,
        index: index ?? this.index,
        content: content ?? this.content,
        items: items ?? this.items);
  }
}

/// 목 (目)
class ItemEntity extends BaseEntity {
  final int? index;
  final String content;

  ItemEntity(
      {super.id,
      super.createdAt,
      super.updatedAt,
      super.removedAt,
      this.index,
      required this.content});

  @override
  ItemEntity copyWith(
      {DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? removedAt,
      int? index,
      String? content}) {
    return ItemEntity(
      id: this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      removedAt: removedAt ?? this.removedAt,
      index: index ?? this.index,
      content: content ?? this.content,
    );
  }
}
