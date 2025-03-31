part of 'p_trip_plan_detail.dart';

class InfoFragment extends StatelessWidget {
  const InfoFragment(this._tripPlan, {super.key});

  final TripPlanEntity _tripPlan;

  @override
  Widget build(BuildContext context) {
    final currentUid = context.read<AuthenticationBloc>().currentUid;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "여행계획",
              style: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            if (currentUid == _tripPlan.creator.id)
              IconButton(
                  onPressed: () {
                    // TODO : 수정 화면으로 라우팅
                  },
                  icon: const Icon(Icons.edit_outlined))
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              color: context.colorScheme.tertiaryContainer.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _tripPlan.content,
                style: context.textTheme.bodyLarge
                    ?.copyWith(color: context.colorScheme.primary),
              ),
              12.height,
              Row(
                children: [
                  const Icon(Icons.calendar_today_outlined, size: 15),
                  12.width,
                  Text(
                    '${_tripPlan.startDate.yyyymmdd}~${_tripPlan.endDate.yyyymmdd}',
                    style: context.textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
                ],
              ),
              12.height,
              Row(
                children: [
                  const Icon(Icons.people_alt_outlined, size: 15),
                  12.width,
                  Text(
                    '${_tripPlan.minHeadCount}~${_tripPlan.maxHeadCount}명',
                    style: context.textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
                ],
              ),
              if (_tripPlan.hashtags.isNotEmpty)
                Wrap(
                  children: _tripPlan.hashtags
                      .map((text) => Padding(
                            padding: const EdgeInsets.only(top: 10, right: 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.tag,
                                    size: 15, color: Colors.blueGrey),
                                6.width,
                                Text(text,
                                    style: context.textTheme.labelMedium
                                        ?.copyWith(color: Colors.blueGrey)),
                              ],
                            ),
                          ))
                      .toList(),
                ),
            ],
          ),
        )
      ],
    );
  }
}
