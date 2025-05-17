import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget({
    super.key,
    this.initText,
    this.labelText,
    this.hintText,
    required this.onFocusLeave,
    this.showClearButton = true,
  });

  final String? initText;
  final String? labelText;
  final String? hintText;
  final void Function(String text) onFocusLeave;
  final bool showClearButton;

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  late bool _borderVisible;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..text = widget.initText ?? '';
    _focusNode = FocusNode()..addListener(_handleFocus);
    _borderVisible = _focusNode.hasFocus;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode
      ..removeListener(_handleFocus)
      ..dispose();
  }

  _handleFocus() {
    setState(() {
      _borderVisible = _focusNode.hasFocus;
    });
    if (!_focusNode.hasFocus) {
      widget.onFocusLeave(_controller.text.trim());
    }
  }

  _handleClear() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Colors.blueGrey),
          border: _borderVisible
              ? const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)))
              : InputBorder.none,
          suffixIcon: widget.showClearButton
              ? IconButton(
                  onPressed: _handleClear,
                  icon: const Icon(
                    Icons.clear,
                    size: 16,
                  ))
              : const SizedBox.shrink()),
      controller: _controller,
      focusNode: _focusNode,
    );
  }
}
