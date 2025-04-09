part of 'auth.storage_datasource_impl.dart';

abstract interface class AuthStorageDataSource {
  Future<String> uploadProfileImage(
      {required String filename,
      required File profileImage,
      bool upsert = false});
}
