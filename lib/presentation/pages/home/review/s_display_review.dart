part of 'p_display_review.dart';

class DisplayReviewScreen extends StatelessWidget {
  const DisplayReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("리뷰"),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                context.push(Routes.createReview.path);
              },
              icon: const Icon(Icons.add_box_outlined))
        ],
      ),
    );
  }
}
