part of 'p_trip_plan_detail.dart';

class CommentFragment extends StatelessWidget {
  const CommentFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "댓글",
          style: context.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),

      ],
    );
  }
}
