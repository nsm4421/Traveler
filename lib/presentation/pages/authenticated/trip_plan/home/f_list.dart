part of 'p_display_trip_plan.dart';

class TripPlanListFragment extends StatelessWidget {
  const TripPlanListFragment(this._data, {super.key});

  final List<TripPlanEntity> _data;

  // TODO : 무한스크롤링

  @override
  Widget build(BuildContext context) {
    if (_data.isEmpty) {
      return Center(
        child: Text(
          "Nothing Fetched",
          style: context.textTheme.displaySmall,
        ),
      );
    }
    return ListView.builder(
        reverse: true,
        itemCount: _data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TripPlanItemWidget(_data[index]),
          );
        });
  }
}
