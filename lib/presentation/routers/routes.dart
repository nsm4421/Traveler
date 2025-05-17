part of 'router_config.dart';

enum Routes {
  entry('/'),
  reprCoverages('/repr_coverage'),
  createReprCoverages('/repr_coverage/create'),
  editReprCoverages('/repr_coverage/edit'),
  ;

  final String path;

  const Routes(this.path);
}
