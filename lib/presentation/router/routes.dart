part of 'router_config.dart';

enum Routes {
  // auth routes
  home('/index'),

  displayCommonTermTemplate('/template/common-term'),
  editCommonTermTemplate('/template/common-term/edit'),
  ;

  final String path;

  const Routes(this.path);
}
