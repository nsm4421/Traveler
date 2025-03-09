import 'package:module/data/model/export.dart';

abstract interface class RemoteTripPlanDataSource {
  Future<void> create(EditTripPlanModel model);

  Future<void> modify({required String id, required EditTripPlanModel data});

  Future<void> delete(String id);
}
