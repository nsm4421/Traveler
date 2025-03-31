part of 'router_config.dart';

enum Routes {
  // auth routes
  auth('/auth', isAuthRoute: true),
  signIn('/auth/sign-in', isAuthRoute: true),
  signUp('/auth/sign-up', isAuthRoute: true),
  // home routes
  displayReview('/home/review', isHomeRoute: true),
  displayTrip('/home/display-trip', isHomeRoute: true),
  search('/home/search', isHomeRoute: true),
  setting('/home/setting', isHomeRoute: true),
  // etc
  tripPlanDetail('/trip-plan/detail', isHomeRoute: false),
  createTripPlan('/trip-plan/create', isHomeRoute: false),
  createJoinApply('/trip-plan/apply/create', isHomeRoute: false);

  final String path;
  final bool isAuthRoute; // 인증 전에 볼 수 있는 페이지 여부
  final bool isHomeRoute; // 홈화면에서 보여지는 페이지 여부

  const Routes(this.path, {this.isAuthRoute = false, this.isHomeRoute = false});
}
