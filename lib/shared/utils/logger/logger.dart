import 'package:logger/logger.dart';

part 'filter.dart';

class CustomLoggerUtil {
  static Logger genLogger(
          {List<LogTags>? allowedTags, PrettyPrinter? printer}) =>
      Logger(
          filter: allowedTags == null || allowedTags.isEmpty
              ? null
              : CustomLogFilter(allowedTags: allowedTags),
          printer: printer ?? PrettyPrinter());
}
