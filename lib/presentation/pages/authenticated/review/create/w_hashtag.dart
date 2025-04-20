part of 'p_create_review.dart';

class EditHashtagWidget extends StatefulWidget {
  const EditHashtagWidget({super.key});

  @override
  State<EditHashtagWidget> createState() => _EditHashtagWidgetState();
}

class _EditHashtagWidgetState extends State<EditHashtagWidget> {
  late TextEditingController _controller;
  late List<String> _hashtags;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _hashtags = context.read<CreateReviewCubit>().state.hashtags;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  String? _handleValidate(String? text) {
    if (text == null || text.isEmpty) {
      return '해시태그를 입력해주세요';
    } else if (_hashtags.contains(text)) {
      return '중복된 해시태그입니다';
    }
    return null;
  }

  void _handleAddHashtag() {}

  void _handleDeleteHashtag(int index)=>(){
    _hashtags.removeAt(index);
    setState(() {

    });
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: _handleValidate,
          controller: _controller,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.tag),
              suffixIcon: IconButton(
                  onPressed: _handleAddHashtag, icon: const Icon(Icons.add))),
        ),
        12.height,
        if (_hashtags.isNotEmpty)
          Wrap(
              children: List.generate(_hashtags.length, (index) {
            return Container(
              child: Row(
                children: [
                  Text(_hashtags[index]),
                  8.width,
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.delete_outline))
                ],
              ),
            );
          }))
      ],
    );
  }
}
