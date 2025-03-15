import 'package:module/data/model/export.dart';
import 'package:module/domain/entity/user/creator.dart';
import 'package:module/shared/shared.export.dart';

import '../user/base.dart';

class TripPlanEntity extends BaseEntity {
  final String? title;
  final String content;
  final int minHeadCount;
  final int maxHeadCount;
  final List<String> hashtags;
  final Country country;
  final DateTime startDate;
  final DateTime endDate;

  TripPlanEntity({
    required super.id,
    super.createdAt,
    this.title,
    required this.content,
    required this.minHeadCount,
    required this.maxHeadCount,
    required this.hashtags,
    required this.country,
    required this.startDate,
    required this.endDate,
    required super.creator,
  });

  factory TripPlanEntity.from(FetchTripPlanModel model) {
    return TripPlanEntity(
        id: model.id,
        title: model.title,
        content: model.content,
        minHeadCount: model.min_head_count,
        maxHeadCount: model.max_head_count,
        hashtags: model.hashtags,
        country: Country.values
            .firstWhere((item) => item.code == model.country_code),
        startDate: DateTime.parse(model.start_date),
        endDate: DateTime.parse(model.end_date),
        creator: CreatorEntity.from(model.creator));
  }
}
