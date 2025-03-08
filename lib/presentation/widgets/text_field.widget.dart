import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.onChange,
      this.validator,
      this.onFocusLeave,
      this.inputDecoration});

  final void Function(String text)? onChange;
  final void Function()? onFocusLeave;
  final String? Function(String?)? validator;
  final InputDecoration? inputDecoration;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_handleOnChange);
    _focusNode = FocusNode()..addListener(_handleFocusLeave);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_handleOnChange)
      ..dispose();
    _focusNode
      ..removeListener(_handleFocusLeave)
      ..dispose();
  }

  _handleOnChange() {
    if (widget.onChange != null) {
      widget.onChange!(_controller.text);
    }
  }

  _handleFocusLeave() {
    if (!_focusNode.hasFocus && widget.onFocusLeave != null) {
      widget.onFocusLeave!();
    }
  }

  String? _handleValidate(String? text) {
    return widget.validator == null ? null : widget.validator!(text);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      validator: _handleValidate,
      decoration: widget.inputDecoration ??
          const InputDecoration(
            border: OutlineInputBorder(),
          ),
    );
  }
}
