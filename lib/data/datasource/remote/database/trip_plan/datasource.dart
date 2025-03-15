import 'package:module/data/model/export.dart';

abstract interface class RemoteTripPlanDataSource {
  Future<Iterable<FetchTripPlanModel>> fetch(
      {DateTime? cursor, int limit = 20});

  Future<Iterable<FetchTripPlanModel>> fetchByUid(
      {required String uid, DateTime? cursor, int limit = 20});

  Future<void> create(EditTripPlanModel model);

  Future<void> modify({required String id, required EditTripPlanModel data});

  Future<void> delete(String id);
}
