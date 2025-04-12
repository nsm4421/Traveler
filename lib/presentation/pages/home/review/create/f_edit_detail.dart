part of 'p_create_review.dart';

class EditDetailFragment extends StatefulWidget {
  const EditDetailFragment({super.key});

  @override
  State<EditDetailFragment> createState() => _EditDetailFragmentState();
}

class _EditDetailFragmentState extends State<EditDetailFragment> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  static const int _maxTitleLength = 30;
  static const int _maxContentLength = 3000;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController()
      ..addListener(_onChangeTitle)
      ..text = context.read<CreateReviewCubit>().state.title;
    _contentController = TextEditingController()
      ..addListener(_onChangeContent)
      ..text = context.read<CreateReviewCubit>().state.content;
  }

  @override
  void dispose() {
    super.dispose();
    _titleController
      ..removeListener(_onChangeTitle)
      ..dispose();
    _contentController
      ..removeListener(_onChangeContent)
      ..dispose();
  }

  _onChangeTitle() {
    context.read<CreateReviewCubit>().updateTitle(_titleController.text.trim());
  }

  _onChangeContent() {
    context
        .read<CreateReviewCubit>()
        .updateContent(_contentController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          12.height,
          TextField(
            controller: _titleController,
            maxLines: 1,
            maxLength: _maxTitleLength,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: '(선택)제목을 입력해주세요'),
          ),
          8.height,
          const Divider(),
          8.height,
          TextField(
            controller: _contentController,
            minLines: 3,
            maxLines: 10,
            maxLength: _maxContentLength,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: '여행지에 대해 리뷰를 남겨보세요'),
          )
        ],
      ),
    );
  }
}
