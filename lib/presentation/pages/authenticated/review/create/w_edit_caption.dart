part of 'p_create_review.dart';

class EditCaptionWidget extends StatefulWidget {
  const EditCaptionWidget({super.key, required this.superContext});

  final BuildContext superContext;

  @override
  State<EditCaptionWidget> createState() => _EditCaptionWidgetState();
}

class _EditCaptionWidgetState extends State<EditCaptionWidget> {
  late final TextEditingController _textEditingController;
  late final PageController _pageController;
  late List<String> _captions;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _captions = widget.superContext.read<CreateReviewCubit>().state.captions;
    _currentIndex = 0;
    _textEditingController = TextEditingController()..text = (_captions.first);
    _pageController = PageController()..addListener(_handlePageChange);
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _pageController
      ..removeListener(_handlePageChange)
      ..dispose();
  }

  _handlePageChange() {
    _currentIndex = (_pageController.page ?? 0).round();
    _textEditingController.text = widget.superContext
        .read<CreateReviewCubit>()
        .state
        .captions[_currentIndex];
  }

  _handleCaptionChange(String text) {
    widget.superContext
        .read<CreateReviewCubit>()
        .updateCaption(index: _currentIndex, text: text);
    setState(() {
      _captions = widget.superContext.read<CreateReviewCubit>().state.captions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop<List<String>>(_captions);
            },
            icon: const Icon(Icons.clear)),
        title: const Text("캡션"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              '${_currentIndex + 1}/${_captions.length}',
              style: context.textTheme.labelLarge,
            ),
          )
        ],
      ),
      body: Center(
        child: SizedBox(
          height: context.width,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.superContext
                .read<CreateReviewCubit>()
                .state
                .assets
                .length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetEntityImageProvider(widget.superContext
                            .read<CreateReviewCubit>()
                            .state
                            .assets[index]))),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: context.bottom),
        child: TextField(
          controller: _textEditingController,
          onChanged: _handleCaptionChange,
          minLines: 1,
          maxLines: 3,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: '캡션을 입력해주세요'),
        ),
      ),
    );
  }
}
