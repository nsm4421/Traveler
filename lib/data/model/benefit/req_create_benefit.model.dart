import 'package:freezed_annotation/freezed_annotation.dart';

part 'req_create_benefit.model.freezed.dart';
part 'req_create_benefit.model.g.dart';

@freezed
@JsonSerializable()
class CreateBenefitRequestModel with _$CreateBenefitRequestModel {
  const CreateBenefitRequestModel({
    this.risk_unit_code,
    required this.category,
    required this.name,
  });

  final String? risk_unit_code; // 위험단위코드
  final String category; // 급부분류
  final String name; // 급부명

  factory CreateBenefitRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateBenefitRequestModelFromJson(json);

  Map<String, Object?> toJson() => _$CreateBenefitRequestModelToJson(this);
}
