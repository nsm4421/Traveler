import 'package:copy_with_extension/copy_with_extension.dart';

import 'repr_product.entity.dart';

part 'integrated_product.entity.g.dart';

/// 통합상품코드
@CopyWith(copyWithNull: true)
class IntegratedProductEntity {
  final String code; // 통합상품코드
  final String name; // 세부보장명
  late final List<ReprProductEntity> reprProducts;
  late final DateTime startDate;
  late final DateTime endDate;

  IntegratedProductEntity({
    required this.code,
    required this.name,
    List<ReprProductEntity>? reprProducts,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    this.startDate = startDate ?? DateTime(9999, 12, 31);
    this.endDate = endDate ?? DateTime(9999, 12, 31);
    this.reprProducts = reprProducts ?? [];
  }
}
