part of 'p_trip_plan_detail.dart';

class DisplayParentCommentFragment extends StatelessWidget {
  const DisplayParentCommentFragment(this._comments, {super.key});

  final List<TripPlanCommentEntity> _comments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _comments.length,
        itemBuilder: (context, index) {
          final comment = _comments[index];
          return ListTile(
            title: Row(
              children: [
                Text(comment.creator.username,
                    style: context.textTheme.labelLarge),
                const Spacer(),
                if (comment.createdAt != null)
                  Text(comment.createdAt!.ago,
                      style: context.textTheme.labelMedium)
              ],
            ),
            subtitle: Text(comment.content),
          );
        });
  }
}
