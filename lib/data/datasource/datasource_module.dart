import 'package:injectable/injectable.dart';

import 'apply/remote_datasource.dart';
import 'apply/remote_datasource_impl.dart';
import 'auth/remote_datasource.dart';
import 'auth/remote_datasource_impl.dart';
import 'journey/remote_datasource.dart';
import 'journey/remote_datasource_impl.dart';

@module
abstract class LocalDataSourceModule {}

@module
abstract class RemoteDataSourceModule {
  @lazySingleton
  RemoteAuthDataSource get auth => RemoteAuthDataSourceImpl();

  @lazySingleton
  RemoteJourneyDataSource get journey => RemoteJourneyDataSourceImpl();

  @lazySingleton
  RemoteApplyDataSource get apply => RemoteApplyDataSourceImpl();
}
