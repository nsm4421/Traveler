import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:karma/domain/entities/product/unit_product_history.entity.dart';

part 'unit_product.entity.g.dart';

/// 단위상품
@CopyWith(copyWithNull: true)
class UnitProductEntity {
  final String code; // 단위상품코드
  final String name; // 단위상품명
  late final List<UnitProductHistoryEntity> unitProductHistories;
  late final DateTime startDate;
  late final DateTime endDate;

  UnitProductEntity(
      {required this.code,
      required this.name,
      List<UnitProductHistoryEntity>? unitProductHistories,
      DateTime? startDate,
      DateTime? endDate}) {
    this.unitProductHistories = unitProductHistories ?? [];
    this.startDate = endDate ?? DateTime(9999, 12, 31);
    this.endDate = endDate ?? DateTime(9999, 12, 31);
  }
}
