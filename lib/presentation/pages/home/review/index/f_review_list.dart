part of 'p_display_review.dart';

class ReviewListFragment extends StatelessWidget {
  const ReviewListFragment(this._reviews, {super.key});

  final List<ReviewEntity> _reviews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _reviews.length,
        itemBuilder: (context, index) {
          final item = _reviews[index];
          return Column(
            children: [
              ReviewItemWidget(item),
              8.height,
              const Divider(),
              8.height,
            ],
          );
        });
  }
}
