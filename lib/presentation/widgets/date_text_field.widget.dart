import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTextFieldWidget extends StatefulWidget {
  const DateTextFieldWidget(
      {super.key, required this.onFocusLeave, this.labelText});

  final void Function(String text) onFocusLeave;
  final String? labelText;

  @override
  State<DateTextFieldWidget> createState() => _DateTextFieldWidgetState();
}

class _DateTextFieldWidgetState extends State<DateTextFieldWidget> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  late bool _showBorder;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode()..addListener(_handleFocus);
    _showBorder = _focusNode.hasFocus;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode
      ..removeListener(_handleFocus)
      ..dispose();
  }

  void _onChanged(String value) {
    // 숫자만 필터링
    final digitsOnly = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (digitsOnly.length == 8) {
      try {
        final parsed = DateFormat('yyyyMMdd').parseStrict(digitsOnly);
        final formatted = DateFormat('yyyy-MM-dd').format(parsed);
        _controller.text = formatted;
        _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length),
        );
      } catch (e) {
        // 유효하지 않은 날짜인 경우 무시하거나 처리
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('유효하지 않은 날짜 형식입니다.')),
        );
      }
    }
  }

  _handleFocus() {
    setState(() {
      _showBorder = _focusNode.hasFocus;
    });
    if (!_focusNode.hasFocus) {
      widget.onFocusLeave(_controller.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: _controller,
      keyboardType: TextInputType.number,
      maxLength: 10, // yyyy-MM-dd
      decoration: InputDecoration(
        border: _showBorder ? const UnderlineInputBorder() : InputBorder.none,
        labelText: widget.labelText,
        counterText: '',
      ),
      onChanged: _onChanged,
    );
  }
}
