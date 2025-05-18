part of 'router_config.dart';

enum Routes {
  entry('/'),
  product('/product'),
  productModeing('/product/moding'),
  reprCoverages('/repr_coverage'),
  editReprCoverages('/repr_coverage/edit'),
  ;

  final String path;

  const Routes(this.path);
}
