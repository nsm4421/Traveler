part of 'p_create_review.dart';

class EditDetailFragment extends StatelessWidget {
  const EditDetailFragment(
      {super.key,
      required this.titleController,
      required this.contentController});

  final TextEditingController titleController;
  final TextEditingController contentController;

  static const int _maxTitleLength = 30;
  static const int _maxContentLength = 3000;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          12.height,
          Row(
            children: [
              const Icon(Icons.flag_circle_outlined),
              8.width,
              Text("여행국가", style: context.textTheme.titleMedium),
              const Spacer(),
              const SelectCountryWidget(),
            ],
          ),
          8.height,
          const Divider(),
          8.height,
          TextField(
            controller: titleController,
            maxLines: 1,
            maxLength: _maxTitleLength,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: '(선택)제목을 입력해주세요'),
          ),
          8.height,
          const Divider(),
          8.height,
          TextField(
            controller: contentController,
            minLines: 3,
            maxLines: 10,
            maxLength: _maxContentLength,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: '여행지에 대해 리뷰를 남겨보세요'),
          ),
          8.height,
          const Divider(),
          8.height,
          const EditHashtagWidget(),
          12.height,
        ],
      ),
    );
  }
}
