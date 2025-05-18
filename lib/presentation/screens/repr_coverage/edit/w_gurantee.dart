part of 'p_edit_repr_coverage.dart';

class GuranteeWidget extends StatelessWidget {
  const GuranteeWidget(this._gurantee, {super.key});

  final GuranteeEntity _gurantee;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: context
              .read<EditReprCoverageCubit>()
              .removeGuranteeByCode(_gurantee.code),
          icon: const Icon(Icons.remove_circle_outline_outlined),
          tooltip: '세부보장 삭제',
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withAlpha(50),
                  width: 1.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('보장', style: Theme.of(context).textTheme.titleSmall),
                    const Spacer(),
                    IconButton(
                      onPressed: context
                          .read<EditReprCoverageCubit>()
                          .insertBenefit(_gurantee.code),
                      icon: const Icon(Icons.add_circle_outline_outlined),
                      tooltip: '급부추가',
                    ),
                  ],
                ),
                if (_gurantee.code != '00')
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Card(
                      child: CustomTextFieldWidget(
                          hintText: '세부보장명을 입력해주세요', onFocusLeave: (text) {}),
                    ),
                  ),
                Column(
                  children: [
                    if (_gurantee.benefits.isNotEmpty)
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: _gurantee.benefits.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: BenefitWidget(
                                gurantee: _gurantee,
                                benefit: _gurantee.benefits[index]),
                          );
                        },
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
