import 'package:logger/logger.dart';

enum LogTags {
  dataSource,
  repository,
  usecase,
  bloc,
  presentation;
}

extension LoggerExtension on Logger {
  /// datasource
  void logErrorOnDataSource(dynamic message) =>
      e([LogTags.dataSource, message]);

  void logInfoOnDataSource(dynamic message) => i([LogTags.dataSource, message]);

  void logTraceOnDataSource(dynamic message) =>
      t([LogTags.dataSource, message]);

  void logWarningOnDataSource(dynamic message) =>
      w([LogTags.dataSource, message]);

  void logDebugOnDataSource(dynamic message) =>
      d([LogTags.dataSource, message]);

  /// repository
  void logErrorOnRepository(dynamic message) =>
      e([LogTags.repository, message]);

  void logInfoOnRepository(dynamic message) => i([LogTags.repository, message]);

  void logTraceOnRepository(dynamic message) =>
      t([LogTags.repository, message]);

  void logWarningOnRepository(dynamic message) =>
      w([LogTags.repository, message]);

  void logDebugOnRepository(dynamic message) =>
      d([LogTags.repository, message]);

  /// usecase
  void logErrorOnUseCase(dynamic message) => e([LogTags.usecase, message]);

  void logInfoOnUseCase(dynamic message) => i([LogTags.usecase, message]);

  void logTraceOnUseCase(dynamic message) => t([LogTags.usecase, message]);

  void logWarningOnUseCase(dynamic message) => w([LogTags.usecase, message]);

  void logDebugOnUseCase(dynamic message) => d([LogTags.usecase, message]);

  /// bloc
  void logErrorOnBloc(dynamic message) => e([LogTags.bloc, message]);

  void logInfoOnBloc(dynamic message) => i([LogTags.bloc, message]);

  void logTraceOnBloc(dynamic message) => t([LogTags.bloc, message]);

  void logWarningOnBloc(dynamic message) => w([LogTags.bloc, message]);

  void logDebugOnBloc(dynamic message) => d([LogTags.bloc, message]);

  /// presentation
  void logErrorOnPresentation(dynamic message) =>
      e([LogTags.presentation, message]);

  void logInfoOnPresentation(dynamic message) =>
      i([LogTags.presentation, message]);

  void logTraceOnPresentation(dynamic message) =>
      t([LogTags.presentation, message]);

  void logWarningOnPresentation(dynamic message) =>
      w([LogTags.presentation, message]);

  void logDebugOnPresentation(dynamic message) =>
      d([LogTags.presentation, message]);
}
