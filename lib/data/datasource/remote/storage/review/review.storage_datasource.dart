part of 'review.storage_datasource_impl.dart';

abstract interface class ReviewStorageDataSource {
  Future<List<String>> uploadImages(List<File> images,
      {void Function(double progress)? onProgress});
}
