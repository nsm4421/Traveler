part of 'p_create_repr_coverage.dart';

class DefineGuranteeFragment extends StatelessWidget {
  const DefineGuranteeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateReprCoverageCubit, CreateReprCoverageState>(
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
              IconButton(
                onPressed:
                    context.read<CreateReprCoverageCubit>().insertGurantee,
                icon: const Icon(Icons.add_circle_outline),
                tooltip: '세부보장 추가하기',
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
