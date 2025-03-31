part of 'p_display_trip_plan.dart';

class TripPlanItemWidget extends StatelessWidget {
  const TripPlanItemWidget(this._item, {super.key});

  final TripPlanEntity _item;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('${_item.country.emoji} ${_item.title}',
          style: context.textTheme.titleMedium),
      subtitle: _item.createdAt == null
          ? const SizedBox.shrink()
          : Text(_item.createdAt!.ago, style: context.textTheme.labelMedium),
      initiallyExpanded: false,
      shape: const RoundedRectangleBorder(side: BorderSide.none),
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: context.colorScheme.primaryContainer.withOpacity(0.5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _item.content,
                    overflow: TextOverflow.clip,
                    style: context.textTheme.bodyLarge,
                  ),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.calendar_today_outlined, size: 15),
                      12.width,
                      Text(
                        '${_item.startDate.yyyymmdd}~${_item.endDate.yyyymmdd}',
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
                        '${_item.minHeadCount}~${_item.maxHeadCount}명',
                        style: context.textTheme.labelMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    ],
                  ),
                  6.height,
                  if (_item.hashtags.isNotEmpty)
                    Align(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        children: _item.hashtags
                            .map(
                              (text) => Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, right: 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.tag,
                                        size: 15,
                                        color: context.colorScheme.primary),
                                    6.width,
                                    Text(text,
                                        style: context.textTheme.labelMedium
                                            ?.copyWith(
                                                color: context
                                                    .colorScheme.primary)),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    context.push(Routes.tripPlanDetail.path, extra: _item);
                  },
                  icon: Icon(Icons.search, color: context.colorScheme.primary))
            ],
          ),
        )
      ],
    );
  }
}
