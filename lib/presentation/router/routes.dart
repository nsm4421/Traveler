part of 'router_config.dart';

enum Routes {
  auth('/auth', isAuthRoute: true),
  signIn('/auth/sign-in', isAuthRoute: true),
  signUp('/auth/sign-up', isAuthRoute: true),
  displayTrip('/trip', isHomeRoute: true),
  createTrip('/trip/create', isHomeRoute: true),
  setting('/setting', isHomeRoute: true);

  final String path;
  final bool isAuthRoute; // 인증 전에 볼 수 있는 페이지 여부
  final bool isHomeRoute; // 홈화면에서 보여지는 페이지 여부

  const Routes(this.path, {this.isAuthRoute = false, this.isHomeRoute = false});
}