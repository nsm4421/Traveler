part of 's_detail.dart';

class DisplayApplyFragment extends StatelessWidget {
  const DisplayApplyFragment(this._entity, {super.key});

  final TripPlanEntity _entity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("참가신청",
                style: context.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const Spacer(),
            IconButton(
                onPressed: () async {
                  await showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      isScrollControlled: true,
                      builder: (_) {
                        return BlocProvider(
                            create: (_) =>
                                getIt<CreateJoinApplyCubit>(param1: _entity),
                            child: SizedBox(
                              height: context.height * 0.8,
                              child: const CreateApplyFragment(),
                            ));
                      });
                },
                icon: const Icon(Icons.check))
          ],
        ),
        12.height,
        SizedBox(
          width: context.width,
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 30,
              itemBuilder: (context, index) {
                // TODO : 참가신청 보여주기
                return Text("참가신청 $index");
              }),
        ),
      ],
    );
  }
}
