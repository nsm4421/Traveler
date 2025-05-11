import 'package:module/data/model/repr_coverage/res_fetch_repr_coverage.model.dart';

import '../benefit/benefit.entity.dart';

/// 세부보장
class DetailedCoverageEntity {
  final int seq; // 세부보장 순번
  final String name; // 세부보장명
  final BenefitEntity benefit; // 급부

  DetailedCoverageEntity({this.name = '', this.seq = 1, required this.benefit});

  DetailedCoverageEntity copyWith({
    String? name,
    int? seq,
    BenefitEntity? benefit,
  }) {
    return DetailedCoverageEntity(
        name: name ?? this.name,
        seq: seq ?? this.seq,
        benefit: benefit ?? this.benefit);
  }

  factory DetailedCoverageEntity.fromDetailModel(ReprCovDetailModel model) {
    assert(model.detailed_cov_name != null);
    return DetailedCoverageEntity(
        benefit: BenefitEntity.fromDetailModel(model),
        name: model.detailed_cov_name ?? '',
        seq: model.seq);
  }
}
