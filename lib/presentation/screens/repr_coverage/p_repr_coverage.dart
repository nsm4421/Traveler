import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:karma/domain/entities/entities.export.dart';
import 'package:karma/presentation/routers/router_config.dart';
import 'package:karma/shared/shared.export.dart';

part 's_repr_coverage.dart';
part 'f_display_repr_coverages.dart';
part 'f_search_repr_coverage.dart';
part 'w_repr_coverage_item.dart';

enum PopUpMenu {
  copy('복사'),
  edit('수정'),
  delete('삭제');

  final String label;

  const PopUpMenu(this.label);
}

final _mockData = [
  ReprCoverageEntity(
      code: 'I00001',
      name: '상해사망',
      category: CoverageCategory.injure,
      gurantees: [
        GuranteeEntity(benefits: [
          BenefitEntity(
              seq: 1, benefitRiskCode: '상해사망위험률코드', exitRiskCode: '상해사망위험률코드')
        ])
      ]),
  ReprCoverageEntity(
      code: 'I00002',
      name: '상해후유장해',
      category: CoverageCategory.injure,
      gurantees: [
        GuranteeEntity(benefits: [
          BenefitEntity(
              seq: 1,
              benefitRiskCode: '상해후유장해위험률코드',
              exitRiskCode: '상해후유장해위험률코드')
        ])
      ]),
  ReprCoverageEntity(
      code: 'D00003',
      name: '질병사망',
      category: CoverageCategory.disease,
      gurantees: [
        GuranteeEntity(benefits: [
          BenefitEntity(
              seq: 1, benefitRiskCode: '질병사망위험률', exitRiskCode: '질병사망위험률')
        ])
      ]),
  ReprCoverageEntity(
      code: 'D00004',
      name: '질병후유장해',
      category: CoverageCategory.disease,
      gurantees: [
        GuranteeEntity(benefits: [
          BenefitEntity(
              seq: 1, benefitRiskCode: '질병후유장해위험률', exitRiskCode: '질병후유장해위험률')
        ])
      ]),
  ReprCoverageEntity(
      code: 'A00004',
      name: '수술비1-5종',
      category: CoverageCategory.injureAndDisease,
      gurantees: [
        ...List.generate(
            5,
            (index) => GuranteeEntity(
                    code: '${index + 1}'.padLeft(2, '0'),
                    name: '상해${index + 1}종',
                    benefits: [
                      BenefitEntity(
                          seq: index + 1,
                          benefitRiskCode: '상해${index + 1}종 위험률')
                    ])),
        ...List.generate(
            5,
            (index) => GuranteeEntity(
                    code: '${index + 6}'.padLeft(2, '0'),
                    name: '질병${index + 6}종',
                    benefits: [
                      BenefitEntity(
                          seq: index + 6,
                          benefitRiskCode: '질병${index + 1}종 위험률')
                    ]))
      ]),
];

class ReprCoveragePage extends StatelessWidget {
  const ReprCoveragePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReprCoverageScreen();
  }
}
