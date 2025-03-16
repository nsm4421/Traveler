part of 'router_config.dart';

enum Routes {
  auth('/auth', isAuthRoute: true),
  signIn('/auth/sign-in', isAuthRoute: true),
  signUp('/auth/sign-up', isAuthRoute: true),
  displayTrip('/trip', isHomeRoute: true),
  myTrip('/trip/my', isHomeRoute: true),
  createTrip('/trip/my/create', isHomeRoute: false),
  createJoinApply('/trip/apply/create', isHomeRoute: false),
  setting('/setting', isHomeRoute: true);

  final String path;
  final bool isAuthRoute; // 인증 전에 볼 수 있는 페이지 여부
  final bool isHomeRoute; // 홈화면에서 보여지는 페이지 여부

  const Routes(this.path, {this.isAuthRoute = false, this.isHomeRoute = false});
}
