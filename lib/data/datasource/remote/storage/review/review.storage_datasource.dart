part of 'review.storage_datasource_impl.dart';

abstract interface class ReviewStorageDataSource {
  Future<List<String>> uploadImages({
    required String uid,
    required List<File> images,
    void Function(double progress)? onProgress,
  });
}
