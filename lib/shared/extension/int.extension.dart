import 'package:flutter/material.dart';

extension IntExtension on int {
  SizedBox get width => SizedBox(width: toDouble());

  SizedBox get height => SizedBox(height: toDouble());

  Duration get durationInMilli => Duration(microseconds: this);

  Duration get durationInSec => Duration(seconds: this);
}
