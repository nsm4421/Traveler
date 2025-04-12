part of 'review.remote_datasource_impl.dart';

abstract interface class RemoteReviewDataSource {
  Future<Iterable<FetchReviewModel>> fetch({DateTime? cursor, int limit = 20});

  Future<FetchReviewModel> findById(String id);

  Future<void> create(CreateReviewModel model);

  Future<void> delete(String id);
}
