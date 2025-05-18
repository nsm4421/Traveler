part of '../p_product_modeling.dart';

class FiterCoverageStepWidget extends StatefulWidget {
  const FiterCoverageStepWidget({super.key});

  @override
  State<FiterCoverageStepWidget> createState() =>
      _FiterCoverageStepWidgetState();
}

class _FiterCoverageStepWidgetState extends State<FiterCoverageStepWidget> {
  late List<String> _optionsOnLeft;
  late List<String> _optionsOnRight;
  late List<String> _selectedOnLeft;
  late List<String> _selectedOnRight;

  @override
  void initState() {
    super.initState();
    _optionsOnLeft = [
      '수술비2(1-5종)',
      '갱신형 수술비2(1-5종)',
      '수술비2(1-5종)(출생전)',
      '갱신형 수술비2(1-5종)(출생전)',
      '[특별조건부]수술비2(1-5종)',
      '[계약전환용]수술비2(1-5종)',
      '[계약전환용]갱신형 수술비2(1-5종)',
    ];
    _optionsOnRight = [];
    _selectedOnLeft = [];
    _selectedOnRight = [];
  }

  _handleSelect(String item) => () {
        setState(() {
          _optionsOnLeft.remove(item);
          _optionsOnRight.add(item);
        });
      };
  _handleUnSelect(String item) => () {
        setState(() {
          _optionsOnLeft.add(item);
          _optionsOnRight.remove(item);
        });
      };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              IconButton(
                onPressed:
                    context.read<AddCoverageCubit>().unSelectReprCoverage,
                icon: const Icon(Icons.restore),
                tooltip: '선택 취소하기',
              ),
              Text(
                context.read<AddCoverageCubit>().state.reprCoverage?.name ?? '',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              const Spacer(),
              IconButton(
                onPressed: context.read<AddCoverageCubit>().goToSaveStep,
                icon: const Icon(Icons.arrow_forward),
                tooltip: '담보생성',
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                          alignment: Alignment.topCenter,
                          child: Text("가능한 구분자 조합")),
                      if (_optionsOnLeft.isNotEmpty)
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: _optionsOnLeft.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: _handleSelect(_optionsOnLeft[index]),
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(_optionsOnLeft[index]),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                          alignment: Alignment.topCenter,
                          child: Text("선택된 구분자 조합")),
                      if (_optionsOnRight.isNotEmpty)
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: _optionsOnRight.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: _handleUnSelect(_optionsOnRight[index]),
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(_optionsOnRight[index]),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
