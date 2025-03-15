part of 's_my_trip.dart';

class TripPlanItemWidget extends StatelessWidget {
  const TripPlanItemWidget(this._item, {super.key});

  final TripPlanEntity _item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: context.colorScheme.primaryContainer.withOpacity(0.3)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_item.title != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: context.colorScheme.primaryContainer),
              child: Row(
                children: [
                  const Icon(Icons.title),
                  8.width,
                  Text(_item.title!),
                ],
              ),
            ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: context.colorScheme.primaryContainer),
            child: Text(_item.content),
          ),
          Text(_item.startDate.toLocal().toString()),
          Text(_item.endDate.toLocal().toString()),
          Text(_item.minHeadCount.toString()),
          Text(_item.maxHeadCount.toString()),
          Text(_item.country.name),
          if (_item.hashtags.isNotEmpty)
            Wrap(
              children: _item.hashtags
                  .map((text) => Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [Icon(Icons.tag), 8.width, Text(text)],
                        ),
                      ))
                  .toList(),
            )
        ],
      ),
    );
  }
}
