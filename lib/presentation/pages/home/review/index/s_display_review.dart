part of 'p_display_review.dart';

class DisplayReviewScreen extends StatefulWidget {
  const DisplayReviewScreen({super.key});

  @override
  State<DisplayReviewScreen> createState() => _DisplayReviewScreenState();
}

class _DisplayReviewScreenState extends State<DisplayReviewScreen>
    with DebounceMixin {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_handleScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController
      ..removeListener(_handleScroll)
      ..dispose();
  }

  _handleScroll() async => await debounce(() async {
        if (_scrollController.position.pixels <
                _scrollController.position.maxScrollExtent - 100 &&
            !context.read<DisplayReviewBloc>().state.isEnd) {
          return;
        }
        context.read<DisplayReviewBloc>().add(FetchDisplayEvent());
      }, delay: 1.durationInSec);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("리뷰"), elevation: 0, actions: [
        IconButton(
            onPressed: () async => await context.push(Routes.createReview.path),
            icon: const Icon(Icons.add_box_outlined))
      ]),
      body: BlocBuilder<DisplayReviewBloc, AbsDisplayState<ReviewEntity>>(
          builder: (context, state) {
        return SingleChildScrollView(
            controller: _scrollController,
            child: ReviewListFragment(state.data));
      }),
    );
  }
}
