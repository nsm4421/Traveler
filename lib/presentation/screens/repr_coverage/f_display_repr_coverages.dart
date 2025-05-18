part of 'p_repr_coverage.dart';

class DisplayReprCovereagesFragment extends StatelessWidget {
  const DisplayReprCovereagesFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: _mockData.length,
        itemBuilder: (context, index) =>
            ReprCoverageItemWidget(_mockData[index]),
        separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Divider(
                indent: 16,
                endIndent: 16,
              ),
            ));
  }
}
