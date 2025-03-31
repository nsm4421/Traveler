part of 'p_trip_plan_detail.dart';

class DisplayApplyFragment extends StatelessWidget {
  const DisplayApplyFragment(
      {super.key, required this.tripPlan, required this.applies});

  final TripPlanEntity tripPlan;
  final List<JoinApplyEntity> applies;

  @override
  Widget build(BuildContext context) {
    final currentUid = context.read<AuthenticationBloc>().currentUid;
    return Column(
      children: [
        Row(
          children: [
            Text("참가신청",
                style: context.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const Spacer(),
            if (currentUid != tripPlan.creator.id)
              IconButton(
                  onPressed: () async {
                    await showModalBottomSheet(
                        context: context,
                        showDragHandle: true,
                        isScrollControlled: true,
                        builder: (_) {
                          return BlocProvider(
                              create: (_) =>
                                  getIt<CreateJoinApplyBloc>(param1: tripPlan)
                                    ..add(MountJoinApplyEvent()),
                              child: const CreateApplyFragment());
                        });
                  },
                  icon: const Icon(Icons.check))
          ],
        ),
        12.height,
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: context.height / 4),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: applies.length,
              itemBuilder: (context, index) {
                final apply = applies[index];
                final switchButtonVisible =
                    (tripPlan.creator.id == currentUid) &&
                        (apply.creator.id != currentUid);
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(apply.creator.sex?.iconData),
                              8.width,
                              Text(
                                apply.creator.username,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Card(
                            color: apply.isAccepted
                                ? context.colorScheme.primaryContainer
                                : context.colorScheme.tertiaryContainer
                                    .withOpacity(0.5),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 6),
                              child: Text(apply.content,
                                  style: context.textTheme.bodyMedium),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      if (switchButtonVisible)
                        BlocProvider(
                            create: (_) =>
                                getIt<JoinApplyApprovalCubit>(param1: apply),
                            child: const SwitchApprovalButtonWidget())
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
