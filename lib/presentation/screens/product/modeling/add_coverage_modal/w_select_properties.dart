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
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
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
                    context.read<AddCoverageCubit>().state.reprCoverage?.name ??
                        '',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("갱신형 운영", style: Theme.of(context).textTheme.titleSmall),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16, top: 4),
                            child: Row(
                              children: [
                                Radio(
                                    value: '미운영',
                                    groupValue: '미운영',
                                    onChanged: (_) {}),
                                Text("미운영"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, top: 4),
                            child: Row(
                              children: [
                                Radio(
                                    value: '운영',
                                    groupValue: '미운영',
                                    onChanged: (_) {}),
                                Text("운영"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text("특별조건부", style: Theme.of(context).textTheme.titleSmall),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16, top: 4),
                            child: Row(
                              children: [
                                Radio(
                                    value: '미운영',
                                    groupValue: '미운영',
                                    onChanged: (_) {}),
                                Text("미운영"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, top: 4),
                            child: Row(
                              children: [
                                Radio(
                                    value: '운영',
                                    groupValue: '미운영',
                                    onChanged: (_) {}),
                                Text("운영"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text("전환용", style: Theme.of(context).textTheme.titleSmall),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16, top: 4),
                            child: Row(
                              children: [
                                Radio(
                                    value: '미운영',
                                    groupValue: '미운영',
                                    onChanged: (_) {}),
                                Text("미운영"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, top: 4),
                            child: Row(
                              children: [
                                Radio(
                                    value: '운영',
                                    groupValue: '미운영',
                                    onChanged: (_) {}),
                                Text("운영"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text("출생전담보 운영여부",
                      style: Theme.of(context).textTheme.titleSmall),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16, top: 4),
                            child: Row(
                              children: [
                                Radio(
                                    value: '운영',
                                    groupValue: '운영',
                                    onChanged: (_) {}),
                                Text("운영"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, top: 4),
                            child: Row(
                              children: [
                                Radio(
                                    value: '운영',
                                    groupValue: '미운영',
                                    onChanged: (_) {}),
                                Text("운영"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text("추가담보운영여부",
                      style: Theme.of(context).textTheme.titleSmall),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16, top: 4),
                            child: Row(
                              children: [
                                Radio(
                                    value: '미운영',
                                    groupValue: '미운영',
                                    onChanged: (_) {}),
                                Text("미운영"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, top: 4),
                            child: Row(
                              children: [
                                Radio(
                                    value: '운영',
                                    groupValue: '미운영',
                                    onChanged: (_) {}),
                                Text("운영"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
