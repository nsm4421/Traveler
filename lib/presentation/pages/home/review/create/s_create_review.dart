part of 'p_create_review.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> _handleJumpPage(int index) async {
    await _pageController.animateToPage(
      index,
      duration: 300.durationInMilli,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: Text(CreateReviewStep.values[_currentIndex].title)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: StepBarWidget(
                currentIndex: _currentIndex,
                handleJumpPage: _handleJumpPage),
          ),
          Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: CreateReviewStep.values.length,
                  itemBuilder: (context, index) {
                    final step = CreateReviewStep.values[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 18),
                      child: switch (step) {
                        CreateReviewStep.selectMedia => SelectImageFragment(),
                        CreateReviewStep.editDetail => EditDetailFragment(),
                        CreateReviewStep.submit => UploadReviewFragment(),
                      },
                    );
                  }))
        ],
      ),
    );
  }
}
