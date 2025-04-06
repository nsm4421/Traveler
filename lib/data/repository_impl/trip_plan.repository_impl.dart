import 'package:injectable/injectable.dart';
import 'package:module/data/datasource/export.dart';
import 'package:module/data/model/export.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/domain/repository/export.dart';
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
  Future<List<TripPlanEntity>> fetch(
      {String? uid, DateTime? cursor, int limit = 20}) async {
    if (uid == null) {
      return await _remoteTripPlanDataSource
          .fetch(cursor: cursor, limit: limit)
          .then((res) => res.map(TripPlanEntity.from).toList());
    } else {
      return await _remoteTripPlanDataSource
          .fetchByUid(uid: uid, cursor: cursor, limit: limit)
          .then((res) => res.map(TripPlanEntity.from).toList());
    }
  }

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
        start_date: startDate,
        end_date: endDate));
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
            start_date: startDate,
            end_date: endDate));
  }
}
