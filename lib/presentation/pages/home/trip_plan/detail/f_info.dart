part of 's_detail.dart';

class InfoFragment extends StatelessWidget {
  const InfoFragment(this._entity, {super.key});

  final TripPlanEntity _entity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_entity.title),
        Text(
          _entity.content,
          style: context.textTheme.bodyLarge
              ?.copyWith(color: context.colorScheme.primary),
        ),
        12.height,
        Row(
          children: [
            const Icon(Icons.calendar_today_outlined, size: 15),
            12.width,
            Text(
              '${_entity.startDate.yyyymmdd}~${_entity.endDate.yyyymmdd}',
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
              '${_entity.minHeadCount}~${_entity.maxHeadCount}명',
              style: context.textTheme.labelMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          ],
        ),
        if (_entity.hashtags.isNotEmpty)
          Wrap(
            children: _entity.hashtags
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
    );
  }
}
