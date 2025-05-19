part of '../p_product_modeling.dart';

class FiterCoverageStepWidget extends StatefulWidget {
  const FiterCoverageStepWidget({super.key});

  @override
  State<FiterCoverageStepWidget> createState() =>
      _FiterCoverageStepWidgetState();
}

class _FiterCoverageStepWidgetState extends State<FiterCoverageStepWidget> {
  late List<ReprCoverageWithPropertiesEntity> _selectedOnLeft;
  late List<ReprCoverageWithPropertiesEntity> _selectedOnRight;

  @override
  void initState() {
    super.initState();
    _selectedOnLeft = [];
    _selectedOnRight = [];
  }

  _handleTapOnLeftSideItem(ReprCoverageWithPropertiesEntity e) => () {
        setState(() {
          if (_selectedOnLeft.contains(e)) {
            _selectedOnLeft.remove(e);
          } else {
            _selectedOnLeft.add(e);
          }
          _selectedOnRight = [];
        });
      };

  _handleTapOnRightSideItem(ReprCoverageWithPropertiesEntity e) => () {
        setState(() {
          if (_selectedOnRight.contains(e)) {
            _selectedOnRight.remove(e);
          } else {
            _selectedOnRight.add(e);
          }
          _selectedOnLeft = [];
        });
      };

  _handleAdd() {
    _selectedOnLeft
        .forEach((e) => context.read<AddCoverageCubit>().addCoverage(e));
    setState(() {
      _selectedOnLeft = [];
    });
  }

  _handlePop() {
    _selectedOnRight
        .forEach((e) => context.read<AddCoverageCubit>().popCoverages(e));
    setState(() {
      _selectedOnRight = [];
    });
  }

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
        Expanded(
          child: SingleChildScrollView(
            child: BlocBuilder<AddCoverageCubit, AddCoverageState>(
              builder: (context, state) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("가능한 조합"),
                              if (state.reprCoverageCandidates.isNotEmpty)
                                Card(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        state.reprCoverageCandidates.length,
                                    itemBuilder: (context, index) {
                                      final e =
                                          state.reprCoverageCandidates[index];
                                      return GestureDetector(
                                        onTap: _handleTapOnLeftSideItem(e),
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: e.isIn(_selectedOnLeft)
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .primaryContainer
                                                  : null,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Text(
                                            e.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    color: e.isIn(
                                                            _selectedOnLeft)
                                                        ? Theme.of(context)
                                                            .colorScheme
                                                            .onPrimaryContainer
                                                        : null),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: _handleAdd,
                            icon: const Icon(Icons.arrow_forward),
                            tooltip: '선택담보 추가',
                          ),
                          const SizedBox(height: 8),
                          IconButton(
                            onPressed: _handlePop,
                            icon: const Icon(Icons.arrow_back),
                            tooltip: '선택담보 제외',
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("추가할 담보 조합"),
                              if (state.reprCoveragesSelected.isNotEmpty)
                                Card(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        state.reprCoveragesSelected.length,
                                    itemBuilder: (context, index) {
                                      final e =
                                          state.reprCoveragesSelected[index];
                                      return GestureDetector(
                                        onTap: _handleTapOnRightSideItem(e),
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: e.isIn(_selectedOnRight)
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .primaryContainer
                                                  : null,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Text(
                                            e.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    color: e.isIn(
                                                            _selectedOnRight)
                                                        ? Theme.of(context)
                                                            .colorScheme
                                                            .onPrimaryContainer
                                                        : null),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
