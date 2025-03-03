part of 'logger.dart';

enum LogTags {
  dataSource,
  repository,
  useCase,
  bloc;
}

class CustomLogFilter extends LogFilter {
  final List<LogTags> allowedTags;

  CustomLogFilter({required this.allowedTags});

  @override
  bool shouldLog(LogEvent event) {
    if (event.message is String) {
      return allowedTags
          .any((tag) => event.message.toString().contains(tag.name));
    }
    return false;
  }
}
