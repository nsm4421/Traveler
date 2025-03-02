import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../pages/home/s_home.dart';
import '../pages/apply/s_apply.dart';

part 'routes.dart';

@singleton
class CustomRouter {
  @singleton
  GoRouter get routerConfig => GoRouter(
        initialLocation: Routes.home.path,
        routes: [
          GoRoute(
            path: Routes.home.path,
            builder: (context, state) => HomeScreen(),
          ),
          GoRoute(
            path: Routes.apply.path,
            builder: (context, state) => ApplyScreen(),
          ),
        ],
      );
}
