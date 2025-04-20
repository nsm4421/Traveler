part of 'p_display_review.dart';

class ReviewItemWidget extends StatefulWidget {
  const ReviewItemWidget(this._review, {super.key});

  final ReviewEntity _review;

  @override
  State<ReviewItemWidget> createState() => _ReviewItemWidgetState();
}

class _ReviewItemWidgetState extends State<ReviewItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            12.width,
            ConditionalRenderWidget<String>(
                data: widget._review.creator.avatarUrl,
                builder: (url) {
                  return CircleAvatar(
                      radius: 20,
                      backgroundImage: CachedNetworkImageProvider(url));
                }),
            12.width,
            Text(
              widget._review.creator.username,
              style: context.textTheme.titleLarge?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            IconButton(
                onPressed: () async => await context
                    .push(Routes.reviewDetail.path, extra: widget._review),
                icon: const Icon(Icons.chevron_right)),
            12.width,
          ]),
          if (widget._review.images.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: CarouselWidget(widget._review.images
                  .map((url) => CachedNetworkImageProvider(url))
                  .toList()),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                const Icon(Icons.article_outlined),
                8.width,
                Text(
                  widget._review.content,
                  style: context.textTheme.bodyLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ]);
  }
}
