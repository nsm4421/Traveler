import 'package:module/shared/shared.export.dart';

import '../user/base.dart';

class TripPlanEntity extends BaseEntity {
  final String title;
  final String content;
  final int maxHeadCount;
  final List<String> hashtags;
  final Country country;
  final DateTime startDate;
  final DateTime endDate;

  TripPlanEntity({
    required super.id,
    super.createdAt,
    required this.title,
    required this.content,
    required this.maxHeadCount,
    required this.hashtags,
    required this.country,
    required this.startDate,
    required this.endDate,
    required super.creator,
  });
}
