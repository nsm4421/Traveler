part of 'p_create_repr_coverage.dart';

enum BenefitPopUpMenu {
  exitRiskRate('탈퇴위험률'),
  eliminationPeriod('면책특성'),
  payRate('지급특성');

  final String label;
  const BenefitPopUpMenu(this.label);
}

class BenefitWidget extends StatelessWidget {
  const BenefitWidget(
      {super.key,
      required GuranteeEntity gurantee,
      required BenefitEntity benefit})
      : _gurantee = gurantee,
        _benefit = benefit;

  final GuranteeEntity _gurantee;
  final BenefitEntity _benefit;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_gurantee.benefits.length > 1)
          IconButton(
            onPressed: context
                .read<CreateReprCoverageCubit>()
                .removeBenefitByCodeAndSeq(
                    code: _gurantee.code, seq: _benefit.seq),
            icon: const Icon(Icons.remove_circle_outline_outlined),
            tooltip: '급부 삭제',
          ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('급부'),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      const Text('특성들'),
                      const SizedBox(width: 4),
                      PopupMenuButton<BenefitPopUpMenu>(
                        onSelected: (value) {
                          // TODO : 특성 추가 버튼 클릭시 동작
                        },
                        itemBuilder: (context) => BenefitPopUpMenu.values
                            .map((e) =>
                                PopupMenuItem(value: e, child: Text(e.label)))
                            .toList(),
                        icon: const Icon(Icons.add_circle_outline_outlined),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Card(
                    child: CustomTextFieldWidget(
                      initText: _benefit.benefitRiskCode,
                      hintText: '급부위험률코드를 입력해주세요',
                      onFocusLeave: (text) {},
                    ),
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
