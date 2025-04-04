import 'package:flutter/material.dart';

extension IntExtension on int {
  SizedBox get width => SizedBox(width: toDouble());

  SizedBox get height => SizedBox(height: toDouble());

  Duration get durationInMilli => Duration(milliseconds: this);

  Duration get durationInSec => Duration(seconds: this);

  Duration get durationInHour => Duration(hours: this);

  Duration get durationInDays => Duration(days: this);
}
