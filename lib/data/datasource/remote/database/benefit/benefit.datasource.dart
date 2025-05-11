part of 'benefit.datasource_impl.dart';

abstract interface class BenefitDataSource {
  Future<void> create(CreateBenefitRequestModel model);

  Future<Iterable<FetchBenefitResponseModel>> fetchAll();
}
