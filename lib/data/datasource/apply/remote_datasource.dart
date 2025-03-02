import 'package:module/data/model/export.dart';

abstract interface class RemoteApplyDataSource {
  Future<void> create(CreateApplyModel model);

  Future<void> delete(String id);

  Future<Iterable<ApplyModel>> fetch();

  Future<void> modify(ModifyApplyModel model);
}
