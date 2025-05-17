part of 'p_create_repr_coverage.dart';

class SelectReprCoverageCateoryWidget extends StatelessWidget {
  const SelectReprCoverageCateoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateReprCoverageCubit, CreateReprCoverageState>(
        builder: (context, state) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '담보분류',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Wrap(
                  children: CoverageCategory.values.map((category) {
                    final isSelected = category == state.category;
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<CreateReprCoverageCubit>()
                            .updateState(category: category);
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                isSelected
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                size: isSelected ? 20 : 18,
                                color: isSelected
                                    ? Theme.of(context).colorScheme.primary
                                    : null,
                              ),
                              const SizedBox(width: 4),
                              Text(category.label,
                                  style: isSelected
                                      ? Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontWeight: FontWeight.w700)
                                      : Theme.of(context).textTheme.labelLarge)
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
