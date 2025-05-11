import 'package:flutter/material.dart';

class ConditionalWidgetBuilder<T> extends StatelessWidget {
  const ConditionalWidgetBuilder(
      {super.key, required this.data, required this.widgetBuilder});

  final T? data;
  final Widget Function(T data) widgetBuilder;

  @override
  Widget build(BuildContext context) {
    return data == null ? const SizedBox.shrink() : widgetBuilder(data as T);
  }
}
