import 'package:module/domain/entity/trip_plan/entity.dart';
import 'package:module/shared/shared.export.dart';

abstract interface class TripPlanRepository {
  Future<List<TripPlanEntity>> fetch(
      {String? uid, DateTime? cursor, int limit = 20});

  Future<void> create({
    required String title,
    required String content,
    required int minHeadCount,
    required int maxHeadCount,
    required Country country,
    required List<String> hashtags,
    required DateTime startDate,
    required DateTime endDate,
  });

  Future<void> modify({
    required String id,
    required String title,
    required String content,
    required int minHeadCount,
    required int maxHeadCount,
    required Country country,
    required List<String> hashtags,
    required DateTime startDate,
    required DateTime endDate,
  });

  Future<void> delete(String id);
}
