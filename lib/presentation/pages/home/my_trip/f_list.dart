part of 's_my_trip.dart';

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
        itemBuilder: (context, index) => Column(
              children: [
                TripPlanItemWidget(_data[index]),
                8.height,
                const Divider(indent: 20, endIndent: 20),
                8.height,
              ],
            ));
  }
}
