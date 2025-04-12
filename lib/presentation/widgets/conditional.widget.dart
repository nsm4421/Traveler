import 'package:flutter/material.dart';

class ConditionalRenderWidget<T> extends StatelessWidget {
  const ConditionalRenderWidget({super.key, this.data, required this.builder});

  final T? data;
  final Widget Function(T data) builder;

  @override
  Widget build(BuildContext context) {
    return data == null ? const SizedBox.shrink() : builder(data as T);
  }
}
