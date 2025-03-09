import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DateInputTextField extends StatefulWidget {
  const DateInputTextField({super.key, required this.onChange});

  final void Function(DateTime dt) onChange;

  @override
  State<DateInputTextField> createState() => _DateInputTextFieldState();
}

class _DateInputTextFieldState extends State<DateInputTextField> {
  late TextEditingController _controller;
  String? _errorText;

  static const _minYear = 1980;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? _handleValidate(String? value) {
    try {
      if (value == null || value.isEmpty) {
        return "생년월일을 입력해주세요";
      } else if (value.length != 8) {
        return "생년월일을 8자로(YYYYMMDD) 입력해주세요";
      }
      final int year = int.tryParse(value.substring(0, 4)) ?? 0;
      final int month = int.tryParse(value.substring(4, 6)) ?? 0;
      final int day = int.tryParse(value.substring(6, 8)) ?? 0;
      final DateTime selectedDate = DateTime(year, month, day);

      if (selectedDate.isAfter(DateTime.now())) {
        return "생년월일은 오늘 이전 날짜로 입력가능합니다";
      } else if (selectedDate.isBefore(DateTime(_minYear))) {
        return "생년월일은 $_minYear년 이후로만 입력가능합니다";
      } else {
        widget.onChange(selectedDate);
        return null;
      }
    } catch (error) {
      return "YYYYMMDD 형태로 날짜를 입력해주세요";
    }
  }

  void _handleOnChange(String? text) {
    setState(() {
      _errorText = _handleValidate(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: _handleOnChange,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      maxLength: 8,
      decoration: InputDecoration(
          hintText: 'YYYYMMDD',
          border: OutlineInputBorder(),
          counterText: '',
          errorText: _errorText),
    );
  }
}
