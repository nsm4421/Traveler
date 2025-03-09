part of 's_create_trip.dart';

class HashtagWidget extends StatefulWidget {
  const HashtagWidget({super.key});

  @override
  State<HashtagWidget> createState() => _HashtagWidgetState();
}

class _HashtagWidgetState extends State<HashtagWidget> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _controller;
  late List<String> _hashtags;

  static const _maxCount = 5;
  static const _maxLength = 30;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _controller = TextEditingController();
    _hashtags = context.read<CreateTripPlanCubit>().state.hashtags;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _handleAdd() {
    if (_hashtags.length >= _maxCount) return;
    _formKey.currentState?.save();
    final ok = _formKey.currentState?.validate();
    if (ok == null || !ok) return;
    setState(() {
      _hashtags = [..._hashtags, _controller.text.trim()];
    });
    context.read<CreateTripPlanCubit>().initState(hashtags: _hashtags);
    _controller.clear();
  }

  _handleDelete(String text) => () {
        setState(() {
          _hashtags.removeWhere((item) => item == text);
        });
        context.read<CreateTripPlanCubit>().initState(hashtags: _hashtags);
      };

  String? _validateHashtag(String? text) {
    if (text == null || text.isEmpty) {
      return "해시태그를 입력해주세요";
    } else if (_hashtags.contains(text)) {
      return "중복된 해시태그 입니다";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.tag),
            12.width,
            Text("해시태그",
                style: context.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
        12.height,
        Form(
          key: _formKey,
          child: TextFormField(
            controller: _controller,
            maxLength: _maxLength,
            validator: _validateHashtag,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              counterText: '',
              suffixIcon: _hashtags.length < _maxCount
                  ? IconButton(
                      icon: const Icon(Icons.add_box_outlined),
                      onPressed: _handleAdd,
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ),
        12.height,
        if (_hashtags.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Wrap(
              children: _hashtags
                  .map((text) => Container(
                        margin: const EdgeInsets.only(right: 12, bottom: 8),
                        padding: const EdgeInsets.only(left: 12, right: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: context.colorScheme.primaryContainer),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              text,
                              style: context.textTheme.labelLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color:
                                      context.colorScheme.onPrimaryContainer),
                            ),
                            6.width,
                            IconButton(
                                onPressed: _handleDelete(text),
                                icon: const Icon(Icons.delete_outline))
                          ],
                        ),
                      ))
                  .toList(),
            ),
          )
      ],
    );
  }
}
