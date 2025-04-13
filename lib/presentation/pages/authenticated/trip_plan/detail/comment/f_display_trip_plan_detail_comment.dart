part of 'p_trip_plan_detail_comment.dart';

class DisplayTripPlanDetailCommentFragment extends StatelessWidget {
  const DisplayTripPlanDetailCommentFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayTripPlanParentCommentBloc,
        AbsDisplayState<TripPlanCommentEntity>>(builder: (context, state) {
      return ListView.builder(
          itemCount: state.data.length,
          itemBuilder: (context, index) {
            final comment = state.data[index];
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Row(
                    children: [
                      Text(comment.creator.username,
                          style: context.textTheme.labelSmall),
                      const Spacer(),
                      if (comment.createdAt != null)
                        Text(comment.createdAt!.toLocal().toIso8601String(),
                            style: context.textTheme.labelSmall)
                    ],
                  ),
                  subtitle: Text(
                    comment.content,
                    overflow: TextOverflow.clip,
                    style: context.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                // 더 가져오기 버튼
                if (!state.isEnd && state.data.length-1 == index)
                  (state.status == Status.initial ||
                          state.status == Status.success)
                      ? ElevatedButton(
                          onPressed: () {
                            context
                                .read<DisplayTripPlanParentCommentBloc>()
                                .add(FetchDisplayEvent(
                                  insertOnHead: false,
                                ));
                          },
                          child: const Text("더 가져오기"))
                      : const Center(child: CircularProgressIndicator())
              ],
            );
          });
    });
  }
}
