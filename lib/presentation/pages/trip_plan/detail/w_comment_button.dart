part of 'p_trip_plan_detail.dart';

class CommentButtonWidget extends StatelessWidget {
  const CommentButtonWidget(this._tripPlan, {super.key});

  final TripPlanEntity _tripPlan;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "댓글",
          style: context.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        12.width,
        // TODO : 댓글개수
        Text("댓글개수", style: context.textTheme.labelSmall),
        const Spacer(),
        IconButton(
            onPressed: () async {
              await showModalBottomSheet(
                  showDragHandle: true,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return SizedBox(
                        height: context.height * 0.8,
                        child: TripPlanDetailCommentPage(_tripPlan));
                  });
            },
            icon: const Icon(Icons.add_comment_outlined))
      ],
    );
  }
}
