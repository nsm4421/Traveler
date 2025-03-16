part of 's_create_join_apply.dart';

class CreateJoinApplyFormFragment extends StatefulWidget {
  const CreateJoinApplyFormFragment({super.key});

  @override
  State<CreateJoinApplyFormFragment> createState() =>
      _CreateJoinApplyFormFragmentState();
}

class _CreateJoinApplyFormFragmentState
    extends State<CreateJoinApplyFormFragment> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    _controller = TextEditingController();
    _focusNode = FocusNode()..addListener(_handleUnFocus);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode
      ..removeListener(_handleUnFocus)
      ..dispose();
    super.dispose();
  }

  _handleUnFocus() {
    context
        .read<CreateJoinApplyCubit>()
        .initState(content: _controller.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          focusNode: _focusNode,
          controller: _controller,
        )
      ],
    );
  }
}
