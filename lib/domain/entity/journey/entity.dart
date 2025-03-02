import 'package:flutter/material.dart';
import 'package:module/data/model/export.dart';
import 'package:module/shared/shared.export.dart';

class JourneyEntity extends BaseEntity {
  final String content;
  final Country country;
  final DateTimeRange dateTimeRange;

  JourneyEntity(
      {required super.id,
      super.createdAt,
      required this.content,
      required this.country,
      required this.dateTimeRange});

  factory JourneyEntity.from(JourneyModel model) => JourneyEntity(
      id: model.id,
      createdAt: DateTime.tryParse(model.created_at),
      content: model.content,
      country:
          Country.values.firstWhere((item) => item.code == model.country_code),
      dateTimeRange: DateTimeRange(
          start: DateTime.parse(model.start), end: DateTime.parse(model.end)));
}
