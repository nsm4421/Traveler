import 'package:injectable/injectable.dart';
import 'package:module/data/datasource/export.dart';
import 'package:module/data/model/export.dart';
import 'package:module/domain/repository/export.dart';
import 'package:module/domain/repository/trip_plan/repository.dart';
import 'package:module/shared/shared.export.dart';

@LazySingleton(as: TripPlanRepository)
class TripPlanRepositoryImpl with LoggerMixIn implements TripPlanRepository {
  final LocalStorageDataSource _localStorageDataSource;
  final RemoteTripPlanDataSource _remoteTripPlanDataSource;

  TripPlanRepositoryImpl(
      {required LocalStorageDataSource localStorageDataSource,
      required RemoteTripPlanDataSource remoteTripPlanDataSource})
      : _localStorageDataSource = localStorageDataSource,
        _remoteTripPlanDataSource = remoteTripPlanDataSource;

  @override
  Future<void> create(
      {required String title,
      required String content,
      required Country country,
      required int minHeadCount,
      required int maxHeadCount,
      required List<String> hashtags,
      required DateTime startDate,
      required DateTime endDate}) async {
    await _remoteTripPlanDataSource.create(EditTripPlanModel(
        title: title,
        content: content,
        country_code: country.code,
        min_head_count: minHeadCount,
        max_head_count: maxHeadCount,
        hashtags: hashtags,
        start_date: startDate.toUtc().toIso8601String(),
        end_date: endDate.toUtc().toIso8601String()));
  }

  @override
  Future<void> delete(String id) async {
    await _remoteTripPlanDataSource.delete(id);
  }

  @override
  Future<void> modify(
      {required String id,
      required String title,
      required String content,
      required Country country,
      required int minHeadCount,
      required int maxHeadCount,
      required List<String> hashtags,
      required DateTime startDate,
      required DateTime endDate}) async {
    await _remoteTripPlanDataSource.modify(
        id: id,
        data: EditTripPlanModel(
            title: title,
            content: content,
            country_code: country.code,
            min_head_count: minHeadCount,
            max_head_count: maxHeadCount,
            start_date: startDate.toUtc().toIso8601String(),
            end_date: endDate.toUtc().toIso8601String()));
  }
}
