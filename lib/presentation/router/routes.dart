part of 'router_config.dart';

enum Routes {
  home('/'),
  journey('/journey'),
  createJourney('/journey/create'),
  apply('/apply'),
  createApply('/apply/create'),
  ;

  final String path;

  const Routes(this.path);
}
