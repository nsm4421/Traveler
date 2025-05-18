part of '../p_product_modeling.dart';

final _mock_all_repr_coverages = [
  ReprCoverageEntity(
      code: 'AAAAA1',
      name: '암진단비',
      category: CoverageCategory.disease,
      gurantees: [
        GuranteeEntity(benefits: [
          BenefitEntity(benefitRiskCode: 'MR000545', exitRiskCode: 'MR000545')
        ])
      ]),
  ReprCoverageEntity(
      code: 'AAAAA2',
      name: '일반상해사망',
      category: CoverageCategory.disease,
      gurantees: [
        GuranteeEntity(benefits: [
          BenefitEntity(benefitRiskCode: 'MR100002', exitRiskCode: 'MR100002')
        ])
      ]),
  ReprCoverageEntity(
      code: 'AAAAA3',
      name: '일반상해후유장해',
      category: CoverageCategory.disease,
      gurantees: [
        GuranteeEntity(benefits: [
          BenefitEntity(benefitRiskCode: 'MR100003', exitRiskCode: 'MR100003')
        ])
      ]),
  ReprCoverageEntity(
      code: 'BBBBB1',
      name: '수술비2(1-5종)',
      category: CoverageCategory.injureAndDisease,
      gurantees: [
        ...List.generate(5, (index) {
          return GuranteeEntity(
              code: {index + 1}.toString().padLeft(2, '0'),
              name: '상해${index + 1}종',
              benefits: [BenefitEntity(benefitRiskCode: 'MR0000${index + 1}')]);
        }),
        ...List.generate(5, (index) {
          return GuranteeEntity(
              code: {index + 6}.toString().padLeft(2, '0'),
              name: '질병${index + 1}종',
              benefits: [BenefitEntity(benefitRiskCode: 'MR0001${index + 1}')]);
        })
      ])
];

class SelectReprCoverageStepWidget extends StatefulWidget {
  const SelectReprCoverageStepWidget({super.key});

  @override
  State<SelectReprCoverageStepWidget> createState() =>
      _SelectReprCoverageStepWidgetState();
}

class _SelectReprCoverageStepWidgetState
    extends State<SelectReprCoverageStepWidget> {
  late TextEditingController _controller;
  List<ReprCoverageEntity> _searched = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_handleOnChange);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_handleOnChange)
      ..dispose();
  }

  _handleOnChange() {
    final text = _controller.text.trim();
    setState(() {
      _searched = text.isEmpty
          ? _mock_all_repr_coverages
          : _mock_all_repr_coverages
              .where((e) => e.name.contains(text))
              .toList();
    });
  }

  _handleClear() {
    _controller.clear();
  }

  void Function() _handleSelect(ReprCoverageEntity reprCoverage) => () {
        context.read<AddCoverageCubit>().selectReprCoverage(reprCoverage);
      };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child:
              Text('대표담보 선택', style: Theme.of(context).textTheme.titleMedium),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '대표담보명을 입력해주세요',
                suffixIcon: IconButton(
                    onPressed: _handleClear, icon: Icon(Icons.clear))),
          ),
        ),
        if (_searched.isNotEmpty)
          ListView.builder(
              shrinkWrap: true,
              itemCount: _searched.length,
              itemBuilder: (context, index) {
                final e = _searched[index];
                return ListTile(
                  onTap: _handleSelect(e),
                  leading: Text(e.category.label),
                  title: Text(e.name),
                );
              })
      ],
    );
  }
}
