import 'package:copy_with_extension/copy_with_extension.dart';
import 'repr_coverage.entity.dart';

part 'product_coverage.entity.g.dart';

/// 상품담보
@CopyWith(copyWithNull: true)
class ProductCoverageEntity {
  final String reprCovCode;
  final String guranteeCode;
  final String name;
  final int seq;
  final bool isRenewal;
  final bool isSpecialConditioned;
  final bool isConvertable;
  final bool isBeforeBirth;
  final bool isAddCov;

  ProductCoverageEntity(
      {required this.reprCovCode,
      this.guranteeCode = '00',
      required this.name,
      this.seq = 0,
      this.isRenewal = false,
      this.isSpecialConditioned = false,
      this.isConvertable = false,
      this.isBeforeBirth = false,
      this.isAddCov = false});

  factory ProductCoverageEntity.fromReprCoverageWithProperty(
      {required ReprCoverageWithPropertiesEntity reprCoverageWithProperty,
      String guranteeCode = '00', // 세부보장코드,
      int seq = 0}) {
    return ProductCoverageEntity(
      reprCovCode: reprCoverageWithProperty.reprCoverage.code,
      name: guranteeCode == '00'
          ? reprCoverageWithProperty.name
          : '${reprCoverageWithProperty.name}(${reprCoverageWithProperty.reprCoverage.gurantees.firstWhere((e) => e.code == guranteeCode).name})',
      seq: seq,
      isRenewal: reprCoverageWithProperty.isRenewal,
      isSpecialConditioned: reprCoverageWithProperty.isSpecialConditioned,
      isConvertable: reprCoverageWithProperty.isConvertable,
      isBeforeBirth: reprCoverageWithProperty.isBeforeBirth,
      isAddCov: reprCoverageWithProperty.isAddCov,
    );
  }
}
