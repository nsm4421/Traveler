part of 'p_review_comment.dart';

class ReviewCommentScreen extends StatelessWidget {
  const ReviewCommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("댓글"),
        centerTitle: true,
      ),
      body: const DisplayReviewCommentFragment(),
      bottomNavigationBar: const CommentTextFieldWidget(),
    );
  }
}
