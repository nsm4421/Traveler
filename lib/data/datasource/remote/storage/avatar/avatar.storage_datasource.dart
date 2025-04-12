part of 'avatar.storage_datasource_impl.dart';

abstract interface class AvatarStorageDataSource {
  Future<String> uploadProfileImage(
      {required String uid,
      required File profileImage,
      bool upsert = true});
}
