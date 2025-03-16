part of 'auth.local_datasource_impl.dart';

abstract interface class LocalStorageDataSource {
  Future<String?> read(String key);

  Future<void> delete(String key);

  Future<void> write(String key, String value);
}
