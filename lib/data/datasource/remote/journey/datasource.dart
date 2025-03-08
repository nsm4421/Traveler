import 'package:module/data/model/export.dart';
import 'package:module/shared/shared.export.dart';

abstract interface class RemoteJourneyDataSource {

  Future<void> create(CreateJourneyModel model);

  Future<void> delete(String id);

  Future<Iterable<JourneyModel>> fetch();

  Future<void> modify(ModifyJourneyModel model);
}
