part of 'p_review_detail.dart';

class ReviewDetailScreen extends StatefulWidget {
  const ReviewDetailScreen(this._review, {super.key});

  final ReviewEntity _review;

  @override
  State<ReviewDetailScreen> createState() => _ReviewDetailScreenState();
}

class _ReviewDetailScreenState extends State<ReviewDetailScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _handleShowCommentPage() {
    context.push(Routes.reviewComment.path, extra: widget._review);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () async {
                context.pop();
              },
              icon: const Icon(Icons.clear)),
          title: ConditionalRenderWidget<String>(
              data: widget._review.title,
              builder: (title) => Text(
                    title,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                  )),
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // TODO : 이미지 클릭시 이미지 확대 및 캡션을 보여주는 화면으로 이동
          if (widget._review.images.isNotEmpty)
            Column(
              children: [
                CarouselWidget(widget._review.images
                    .map((url) => CachedNetworkImageProvider(url))
                    .toList()),
                8.height,
                const Divider(),
                8.height,
              ],
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Card(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(widget._review.content,
                          style: context.textTheme.bodyLarge),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.comment_outlined),
                    6.width,
                    Text("댓글",
                        style: context.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700))
                  ],
                ),
                8.height,
                TextField(
                  readOnly: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "댓글을 입력해주세요"),
                  onTap: _handleShowCommentPage,
                )
              ],
            ),
          )
        ])));
  }
}
