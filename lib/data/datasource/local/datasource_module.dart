import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:module/shared/shared.export.dart';

import 'auth/datasource.dart';
import 'auth/datasource_impl.dart';

@module
abstract class LocalDataSourceModule with LoggerMixIn {
  final _storage = const FlutterSecureStorage();

  @lazySingleton
  LocalStorageDataSource get storage =>
      LocalStorageDataSourceImpl(storage: _storage, logger: logger);
}
