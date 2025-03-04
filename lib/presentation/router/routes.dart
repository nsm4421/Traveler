part of 'router_config.dart';

enum Routes {
  home('/'),
  signIn('/auth/sign-in'),
  signUp('/auth/sign-up'),
  journey('/journey'),
  createJourney('/journey/create'),
  apply('/apply'),
  createApply('/apply/create'),
  ;

  final String path;

  const Routes(this.path);
}
