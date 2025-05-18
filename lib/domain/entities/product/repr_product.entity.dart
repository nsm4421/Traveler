import 'package:copy_with_extension/copy_with_extension.dart';
import 'unit_product.entity.dart';

part 'repr_product.entity.g.dart';

/// 대표상품
@CopyWith(copyWithNull: true)
class ReprProductEntity {
  final String code; // 대표상품코드
  final String name; // 대표상품명
  late final List<UnitProductEntity> unitProducts;
  late final DateTime startDate;
  late final DateTime endDate;

  ReprProductEntity({
    required this.code,
    required this.name,
    List<UnitProductEntity>? unitProducts,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    this.startDate = startDate ?? DateTime(9999, 12, 31);
    this.endDate = startDate ?? DateTime(9999, 12, 31);
    this.unitProducts = unitProducts ?? [];
  }
}
