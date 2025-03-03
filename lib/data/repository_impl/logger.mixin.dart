import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:module/shared/shared.export.dart';

@lazySingleton
mixin class RepositoryLoggerMixIn {
  final Logger logger =
      CustomLoggerUtil.genLogger(allowedTags: [LogTags.repository]);
}
