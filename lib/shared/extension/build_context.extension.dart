import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Size get size => MediaQuery.of(this).size;

  double get bottom => MediaQuery.of(this).viewInsets.bottom;

  EdgeInsets get padding => MediaQuery.of(this).padding;

  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  void showSnackBar(String message, {int? maxLines, Duration? duration}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(
        message,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines ?? 1,
      ),
      duration: duration ?? 1.seconds,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    ));
  }
}
