part of 'p_create_repr_coverage.dart';

class SelectCoverageCateogryWidget extends StatefulWidget {
  const SelectCoverageCateogryWidget(this._coverageType, {super.key});

  final CoverageType _coverageType;

  @override
  State<SelectCoverageCateogryWidget> createState() =>
      _SelectCoverageCateogryWidgetState();
}

class _SelectCoverageCateogryWidgetState
    extends State<SelectCoverageCateogryWidget> {
  CoverageCategory _coverageCategory = CoverageCategory.values.first;

  _handleChangeCategory(CoverageCategory? category) {
    if (category == null) return;
    setState(() {
      _coverageCategory = category;
    });
    _updateCubitState(category);
  }

  _updateCubitState(CoverageCategory? category) {
    switch (widget._coverageType) {
      case CoverageType.singleBenefit:
        context
            .read<CreateSingleBenefitReprCoverageCubit>()
            .updateState(category: category);
      case CoverageType.multipleBenefit:
        context
            .read<CreateMultipleBenefitReprCoverageCubit>()
            .updateState(category: category);
      case CoverageType.multipleDetailedCoverage:
        context
            .read<CreateMultipleDetailedCoverageReprCoverageCubit>()
            .updateState(category: category);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.category, size: 16),
            4.width,
            Text('담보분류', style: context.textTheme.titleSmall),
          ],
        ),
        4.height,
        Card(
          child: Row(
            children: List.generate(CoverageCategory.values.length, (index) {
              final value = CoverageCategory.values[index];
              return Wrap(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 4, bottom: 4, right: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio<CoverageCategory>(
                          value: value,
                          groupValue: _coverageCategory,
                          onChanged: _handleChangeCategory,
                        ),
                        2.width,
                        Text(value.label,
                            style: context.textTheme.labelLarge?.copyWith(
                                fontWeight: _coverageCategory == value
                                    ? FontWeight.w700
                                    : null)),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        )
      ],
    );
  }
}
