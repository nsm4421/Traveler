part of 'p_create_review.dart';

class UploadReviewFragment extends StatelessWidget {
  const UploadReviewFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(child: PreviewReviewWidget()),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.small(
          child: const Icon(Icons.chevron_right),
          onPressed: () async {
            await context.read<CreateReviewCubit>().submit();
          }),
    );
  }
}
