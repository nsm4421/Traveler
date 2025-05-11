import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:module/shared/export.dart';

part 'res_fetch_repr_coverage.model.freezed.dart';
part 'res_fetch_repr_coverage.model.g.dart';

@freezed
@JsonSerializable()
class FetchReprCoverageResponseModel with _$FetchReprCoverageResponseModel {
  FetchReprCoverageResponseModel({
    required this.id,
    required this.code,
    required this.name,
    required this.type,
    required this.category,
    required this.details,
  });

  final String id;
  final String code; // 대표담보코드
  final String name; // 대표담보코드명
  final CoverageType type; // 담보유형
  final CoverageCategory category; // 담보분류
  final List<ReprCovDetailModel> details;

  factory FetchReprCoverageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FetchReprCoverageResponseModelFromJson(json);
}

@freezed
@JsonSerializable()
class ReprCovDetailModel with _$ReprCovDetailModel {
  ReprCovDetailModel({
    required this.seq, // 순번
    required this.benefit_id, // 급부id
    required this.benefit_name, // 급부명
    required this.benefit_category, // 급부분류
    required this.risk_unit_code, // 위험단위코드
    required this.detailed_cov_name, // 세부보장명
  });

  final int seq;
  final String benefit_id;
  final String benefit_name;
  final BenefitCategory benefit_category;
  final String? risk_unit_code;
  final String? detailed_cov_name;

  factory ReprCovDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ReprCovDetailModelFromJson(json);
}
