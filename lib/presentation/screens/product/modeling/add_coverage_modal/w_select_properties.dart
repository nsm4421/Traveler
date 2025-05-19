part of '../p_product_modeling.dart';

class SelectPropertiesStepWidget extends StatefulWidget {
  const SelectPropertiesStepWidget({super.key});

  @override
  State<SelectPropertiesStepWidget> createState() =>
      _SelectPropertiesStepWidgetState();
}

class _SelectPropertiesStepWidgetState
    extends State<SelectPropertiesStepWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                onPressed: context.read<AddCoverageCubit>().goToFilterStep,
                icon: const Icon(Icons.arrow_forward),
                tooltip: '조건선택완료',
              ),
            ],
          ),
        ),
        const Divider(),
        BlocBuilder<AddCoverageCubit, AddCoverageState>(
            builder: (context, state) {
          return Expanded(
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("구분자 선택",
                              style: Theme.of(context).textTheme.titleMedium),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: ProductCoveragePropertyRadioWidget(
                                title: '갱신형 운영여부',
                                checked: state.renewalChecked,
                                onChange: (v) {
                                  context
                                      .read<AddCoverageCubit>()
                                      .checkOption(renewalChecked: v);
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: ProductCoveragePropertyRadioWidget(
                                title: '특별조건부 운영여부',
                                checked: state.specialConditionChecked,
                                onChange: (v) {
                                  context
                                      .read<AddCoverageCubit>()
                                      .checkOption(specialConditionChecked: v);
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: ProductCoveragePropertyRadioWidget(
                                title: '전환형 운영여부',
                                checked: state.convertableChecked,
                                onChange: (v) {
                                  context
                                      .read<AddCoverageCubit>()
                                      .checkOption(convertableChecked: v);
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: ProductCoveragePropertyRadioWidget(
                                title: '출생전 운영여부',
                                checked: state.beforeBirthChecked,
                                onChange: (v) {
                                  context
                                      .read<AddCoverageCubit>()
                                      .checkOption(beforeBirthChecked: v);
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: ProductCoveragePropertyRadioWidget(
                                title: '추가담보 운영여부',
                                checked: state.addCovChecked,
                                onChange: (v) {
                                  context
                                      .read<AddCoverageCubit>()
                                      .checkOption(addCovChecked: v);
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("가능한 담보조합",
                              style: Theme.of(context).textTheme.titleMedium),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Card(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.reprCoverageCandidates.length,
                                itemBuilder: (context, index) {
                                  final coverage =
                                      state.reprCoverageCandidates[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    child: Text(coverage.name),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        })
      ],
    );
  }
}

class ProductCoveragePropertyRadioWidget extends StatelessWidget {
  const ProductCoveragePropertyRadioWidget({
    super.key,
    required this.title,
    required this.checked,
    required this.onChange,
  });

  final String title;
  final bool checked;
  final void Function(bool value) onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleSmall),
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16, top: 4),
                  child: Row(
                    children: [
                      Radio<bool>(
                          value: false,
                          groupValue: checked,
                          onChanged: (v) {
                            if (v == null) return;
                            onChange(v);
                          }),
                      const Text("미운영"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16, top: 4),
                  child: Row(
                    children: [
                      Radio<bool>(
                          value: true,
                          groupValue: checked,
                          onChanged: (v) {
                            if (v == null) return;
                            onChange(v);
                          }),
                      const Text("운영"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
