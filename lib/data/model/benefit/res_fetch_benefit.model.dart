import 'package:freezed_annotation/freezed_annotation.dart';
import '../meta_data.model.dart';

part 'res_fetch_benefit.model.freezed.dart';
part 'res_fetch_benefit.model.g.dart';

@freezed
@JsonSerializable()
class FetchBenefitResponseModel extends MetaDataModel
    with _$FetchBenefitResponseModel {
  FetchBenefitResponseModel({
    required super.id,
    super.created_at,
    super.updated_at,
    super.removed_at,
    super.created_by,
    super.updated_by,
    this.risk_unit_code,
    required this.name,
  });

  final String? risk_unit_code; // 위험단위코드
  final String name; // 급부명

  factory FetchBenefitResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FetchBenefitResponseModelFromJson(json);
}
