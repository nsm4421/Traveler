part of 'p_review_comment.dart';

class DisplayReviewCommentFragment extends StatelessWidget {
  const DisplayReviewCommentFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayParentReviewCommentBloc,
        AbsDisplayState<ReviewCommentEntity>>(builder: (context, state) {
      return LoadingOverLayWidget(
          isLoading: state.status == Status.loading,
          child: state.data.isEmpty
              ? Center(
                  child: Text(
                  "댓글이 없습니다",
                  style: context.textTheme.bodyLarge,
                ))
              : ListView.separated(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    final item = state.data[index];
                    return ListTile(
                      leading: ConditionalRenderWidget<String>(
                          data: item.creator.avatarUrl,
                          builder: (url) {
                            return CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(url),
                            );
                          }),
                      title: Text(
                        item.content,
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                ));
    });
  }
}
