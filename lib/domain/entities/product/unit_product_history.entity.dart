import 'package:copy_with_extension/copy_with_extension.dart';

part 'unit_product_history.entity.g.dart';

/// 단위상품이력코드
@CopyWith(copyWithNull: true)
class UnitProductHistoryEntity {
  final String code; // 단위상품이력코드
  final String name; // 단위상품이력명
  late final DateTime startDate;
  late final DateTime endDate;

  UnitProductHistoryEntity(
      {required this.code,
      required this.name,
      DateTime? startDate,
      DateTime? endDate}) {
    this.startDate = startDate ?? DateTime(9999, 12, 31);
    this.endDate = endDate ?? DateTime(9999, 12, 31);
  }
}
