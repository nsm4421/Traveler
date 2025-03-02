part of 'router_config.dart';

enum Routes {
  home('/'),
  apply('/apply');

  final String path;

  const Routes(this.path);
}
