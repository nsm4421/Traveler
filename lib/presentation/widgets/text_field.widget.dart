import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.initText = '',
      this.onChange,
      this.validator,
      this.onFocusLeave,
      this.inputDecoration,
      this.obsecureText = false,
      this.maxLength,
      this.minLines = 1,
      this.maxLines = 1});

  final String? initText;
  final void Function(String text)? onChange;
  final void Function(String text)? onFocusLeave;
  final String? Function(String?)? validator;
  final InputDecoration? inputDecoration;
  final bool obsecureText;
  final int? maxLength;
  final int minLines;
  final int maxLines;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()
      ..addListener(_handleOnChange)
      ..text = widget.initText ?? '';
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
      widget.onFocusLeave!(_controller.text);
    }
  }

  String? _handleValidate(String? text) {
    return widget.validator == null ? null : widget.validator!(text);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      controller: _controller,
      focusNode: _focusNode,
      obscureText: widget.obsecureText,
      validator: _handleValidate,
      decoration: widget.inputDecoration ??
          const InputDecoration(
            border: OutlineInputBorder(),
          ),
    );
  }
}
