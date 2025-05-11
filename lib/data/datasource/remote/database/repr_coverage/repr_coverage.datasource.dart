part of 'repr_coverage.datasource_impl.dart';

abstract interface class ReprCoverageDataSource {
  Future<void> insert(Iterable<CreateReprCoverageRequestModel> models);

  Future<Iterable<FetchReprCoverageResponseModel>> fetchAll();
}
