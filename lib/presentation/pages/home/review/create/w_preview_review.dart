part of 'p_create_review.dart';

class PreviewReviewWidget extends StatefulWidget {
  const PreviewReviewWidget({super.key});

  @override
  State<PreviewReviewWidget> createState() => _PreviewReviewWidgetState();
}

class _PreviewReviewWidgetState extends State<PreviewReviewWidget>
    with DebounceMixin {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _handleSwipeImage(int index) async => debounce(() async {
        await _controller.animateToPage(
          index,
          duration: 500.durationInMilli,
          curve: Curves.easeInOut,
        );
      });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateReviewCubit, CreateReviewState>(
        builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (state.assets.isNotEmpty)
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.photo, color: context.colorScheme.primary),
                          8.width,
                          Text("사진",
                              style: context.textTheme.titleMedium?.copyWith(
                                  color: context.colorScheme.primary,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: context.width - 12,
                            child: PageView.builder(
                                controller: _controller,
                                itemCount: state.assets.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                      margin: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.black,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetEntityImageProvider(
                                                state.assets[index],
                                                thumbnailSize: ThumbnailSize(
                                                    context.width.toInt() - 20,
                                                    context.height.toInt() -
                                                        20)),
                                          )));
                                }),
                          ),
                          if (state.assets.length > 1)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Center(
                                child: SmoothPageIndicator(
                                  controller: _controller,
                                  count: state.assets.length,
                                  onDotClicked: _handleSwipeImage,
                                  effect: WormEffect(
                                    dotHeight: 12,
                                    dotWidth: 12,
                                    activeDotColor: context.colorScheme.primary,
                                    dotColor: context.colorScheme.tertiary
                                        .withAlpha(50),
                                    type: WormType.thinUnderground,
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
              ],
            ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state.title.isNotEmpty)
                    Padding(
                        padding: const EdgeInsets.only(top: 21, bottom: 8),
                        child: Text(state.title,
                            style: context.textTheme.titleLarge?.copyWith(
                                color: context.colorScheme.primary,
                                fontWeight: FontWeight.w700))),
                  Text(
                    state.content,
                    overflow: TextOverflow.clip,
                    style: context.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  )
                ],
              )),
        ],
      );
    });
  }
}
