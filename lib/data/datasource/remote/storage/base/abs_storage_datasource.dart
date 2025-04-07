part of 'abs_storage_datasource_impl.dart';

abstract interface class AbsStorageDataSource {
  Future<void> uploadFile({
    required File file,
    MediaType? defaultMediaType,
    required String pathInBucket,
    bool upsert = false,
    void Function(double progress)? onProgress,
  });

  String getPublicUrl(String pathInBucket);

  Future<String> getSignedUrl(
      {required String pathInBucket, int expiresInSec = 60});
}
