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
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Row(children: [
        12.width,
        ConditionalRenderWidget<String>(
            data: widget._review.creator.avatarUrl,
            builder: (url) {
              return CircleAvatar(
                  radius: 20, backgroundImage: CachedNetworkImageProvider(url));
            }),
        12.width,
        Text(
          widget._review.creator.username,
          style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.primary, fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        12.width,
      ]),
      if (widget._review.images.isNotEmpty)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: NetworkImageCarouselWidget(widget._review.images),
        ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ConditionalRenderWidget<String>(
                      data: widget._review.title,
                      builder: (title) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              title,
                              style: context.textTheme.titleLarge,
                            ),
                          )),
                  Text(widget._review.content,
                      style: context.textTheme.bodyLarge),
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
