part of 'router_config.dart';

enum Routes {
  auth('/auth', isAuthRoute: true),
  signIn('/auth/sign-in', isAuthRoute: true),
  signUp('/auth/sign-up', isAuthRoute: true),
  displayTrip('/trip'),
  createTrip('/trip/create'),
  setting('/setting')
  ;

  final String path;
  final bool isAuthRoute;

  const Routes(this.path, {this.isAuthRoute = false});
}
