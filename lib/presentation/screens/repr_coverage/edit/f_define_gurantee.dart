part of 'p_edit_repr_coverage.dart';

enum CoveragePopUpMenu {
  addGurantee('세부보장'),
  elimination('면책특성'),
  exitRate('탈퇴율');

  final String label;
  const CoveragePopUpMenu(this.label);
}

class DefineGuranteeFragment extends StatelessWidget {
  const DefineGuranteeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditReprCoverageCubit, EditReprCoverageState>(
        builder: (context, state) {
      return Column(
        children: [
          Row(
            children: [
              Text(
                "담보 모델링",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Spacer(),
              PopupMenuButton<CoveragePopUpMenu>(
                onSelected: (menu) {
                  switch (menu) {
                    case CoveragePopUpMenu.addGurantee:
                      context.read<EditReprCoverageCubit>().insertGurantee();
                      return;
                    case CoveragePopUpMenu.elimination:
                    case CoveragePopUpMenu.exitRate:
                    // TODO : 탈퇴율 추가하기
                  }
                },
                itemBuilder: (context) => CoveragePopUpMenu.values
                    .map(
                      (e) => PopupMenuItem(value: e, child: Text(e.label)),
                    )
                    .toList(),
                icon: const Icon(Icons.add_circle_outline_outlined),
                tooltip: '담보추가',
              )
            ],
          ),
          if (state.gurantees.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              itemCount: state.gurantees.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: GuranteeWidget(state.gurantees[index]),
                );
              },
            ),
        ],
      );
    });
  }
}
