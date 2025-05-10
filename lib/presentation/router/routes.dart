part of 'router_config.dart';

enum Routes {
  entry('/entry'),
  reprCoverage('/repr-coverage'),
  createReprCoverage('/repr-coverage/create');

  final String path;

  const Routes(this.path);
}
