part of 's_create_journey.dart';

class EditContentFragment extends StatefulWidget {
  const EditContentFragment({super.key});

  @override
  State<EditContentFragment> createState() => _EditContentFragmentState();
}

class _EditContentFragmentState extends State<EditContentFragment> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late FocusNode _titleFocus;
  late FocusNode _contentFocus;

  @override
  void initState() {
    _titleController = TextEditingController();
    _titleFocus = FocusNode()..addListener(_handleUpdateTitle);
    _contentController = TextEditingController();
    _contentFocus = FocusNode()..addListener(_handleUpdateContent);
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _titleFocus
      ..removeListener(_handleUpdateTitle)
      ..dispose();
    _contentController.dispose();
    _contentFocus
      ..removeListener(_handleUpdateContent)
      ..dispose();
    super.dispose();
  }

  _handleUpdateTitle() {
    if (!_titleFocus.hasFocus) {
      context.read<CreateJourneyCubit>().update(title: _titleController.text);
    }
  }

  _handleUpdateContent() {
    if (!_contentFocus.hasFocus) {
      context.read<CreateJourneyCubit>().update(title: _contentController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          focusNode: _titleFocus,
          controller: _titleController,
        ),
        TextFormField(
          focusNode: _contentFocus,
          controller: _contentController,
        )
      ],
    );
  }
}
