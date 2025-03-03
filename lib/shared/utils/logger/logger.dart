import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

enum LogTags {
  dataSource,
  repository,
  useCase,
  bloc;
}

@lazySingleton
mixin class LoggerMixIn {
  final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
    ),
  );
}
