import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:module/shared/shared.export.dart';
import 'auth/datasource.dart';
import 'auth/datasource_impl.dart';

@module
abstract class LocalDataSourceModule with LoggerMixIn {
  static const _localDbName = 'app.db';

  final _storage = const FlutterSecureStorage();

  final _localDataBase = LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, _localDbName));
    return NativeDatabase.createInBackground(file);
  });

  @lazySingleton
  LocalStorageDataSource get storage =>
      LocalStorageDataSourceImpl(storage: _storage, logger: logger);
}
