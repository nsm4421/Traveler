import 'package:timeago/timeago.dart' as timeago;

extension DateTimeExtension on DateTime {
  String get utcString => this.toUtc().toString();

  String get yyyymmdd => '$year-$month-$day';

  String get ago => timeago.format(this, locale: 'ko');
}
