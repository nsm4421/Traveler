part of 'p_create_trip_plan.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget(this._formKey, {super.key});

  final GlobalKey<FormState> _formKey;

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  static const _titleMaxLength = 30;
  static const _contentMaxLength = 500;

  _onTitleFocusLeave(String text) =>
      context.read<CreateTripPlanCubit>().initState(title: text.trim());

  _onContentFocusLeave(String text) =>
      context.read<CreateTripPlanCubit>().initState(content: text.trim());

  String? _validateContent(String? text) =>
      text == null || text.isEmpty ? "본문을 입력해주세요" : null;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.title),
                    12.width,
                    Text("제목",
                        style: context.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
                8.height,
                CustomTextField(
                    onFocusLeave: _onTitleFocusLeave,
                    maxLength: _titleMaxLength,
                    inputDecoration: const InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(),
                        hintText: "제목을 입력해주세요")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.abc),
                    12.width,
                    Text("본문",
                        style: context.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
                8.height,
                CustomTextField(
                    onFocusLeave: _onContentFocusLeave,
                    validator: _validateContent,
                    maxLength: _contentMaxLength,
                    minLines: 3,
                    maxLines: 5,
                    inputDecoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "본문을 입력해주세요")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
