import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:module/shared/export.dart';

part 'req_create_repr_coverage.model.freezed.dart';
part 'req_create_repr_coverage.model.g.dart';

@freezed
@JsonSerializable()
class CreateReprCoverageRequestModel with _$CreateReprCoverageRequestModel {
  CreateReprCoverageRequestModel(
      {required this.code,
      required this.name,
      required this.type,
      required this.category,
      this.seq = 0,
      required this.benefit_id,
      this.detailed_cov_name}) {
    if (type == CoverageType.multipleDetailedCoverage) {
      // 세부보장이 여러개인 경우, 세부보장명 필수
      assert(detailed_cov_name != null);
    } else {
      // 세부보장이 없는 경우, 세부보장명 null
      assert(detailed_cov_name == null);
    }
  }

  final String code; // 대표담보코드
  final String name; // 대표담보코드명
  final CoverageType type; // 담보유형
  final CoverageCategory category; // 담보분류
  final int seq;
  final String benefit_id;
  final String? detailed_cov_name; // 세부보장이 있는 경우;

  factory CreateReprCoverageRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateReprCoverageRequestModelFromJson(json);

  Map<String, Object?> toJson() => _$CreateReprCoverageRequestModelToJson(this);
}
