import 'package:copy_with_extension/copy_with_extension.dart';
import 'repr_coverage.entity.dart';

part 'product_coverage.entity.g.dart';

/// 상품담보
@CopyWith(copyWithNull: true)
class ProductCoverageEntity {
  final String? code; // 상품담보코드
  final String name;
  final int seq;
  final bool isRenewal;
  final bool isSpecialConditioned;
  final bool isConvertable;
  final bool isBeforeBirth;
  final bool isAddCov;

  ProductCoverageEntity(
      {required this.name,
      this.code,
      this.seq = 0,
      this.isRenewal = false,
      this.isSpecialConditioned = false,
      this.isConvertable = false,
      this.isBeforeBirth = false,
      this.isAddCov = false});

  factory ProductCoverageEntity.fromReprCoverage({
    String? code,
    required ReprCoverageEntity reprCoverage,
    String guranteeCode = '00', // 세부보장코드
    required int seq,
    bool isAddCov = false,
    bool isBeforeBirth = false,
    bool isConvertable = false,
    bool isRenewal = false,
    bool isSpecialConditioned = false,
  }) {
    var name = reprCoverage.name;
    if (guranteeCode != '00') {
      // 세부보장명
      name =
          '$name[${reprCoverage.gurantees.firstWhere((e) => e.code == guranteeCode).name}]';
    }
    if (isAddCov) {
      name = '$name(추가보장)';
    }
    if (isBeforeBirth) {
      name = '$name(출생전)';
    }
    if (isConvertable) {
      name = "$name(전환형)";
    }
    if (isRenewal) {
      name = '갱신형 $name';
    }
    if (isSpecialConditioned) {
      name = '[특별조건부]$name';
    }
    return ProductCoverageEntity(
      code: code,
      seq: seq,
      name: name,
      isRenewal: isRenewal,
      isSpecialConditioned: isSpecialConditioned,
      isConvertable: isConvertable,
      isBeforeBirth: isBeforeBirth,
      isAddCov: isAddCov,
    );
  }
}
