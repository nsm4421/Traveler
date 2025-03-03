import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:module/dependency_injection.dart';
import 'package:module/presentation/bloc/journey/create/cubit.dart';

import '../pages/apply/create/s_create_apply.dart';
import '../pages/home/s_home.dart';
import '../pages/apply/display/s_display_apply.dart';
import '../pages/journey/create/s_create_journey.dart';
import '../pages/journey/display/s_journey.dart';

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
            builder: (context, state) => DisplayApplyScreen(),
          ),
          GoRoute(
            path: Routes.createApply.path,
            builder: (context, state) => const CreateApplyScreen(),
          ),
          GoRoute(
            path: Routes.journey.path,
            builder: (context, state) => DisplayJourneyScreen(),
          ),
          GoRoute(
            path: Routes.createJourney.path,
            builder: (context, state) => BlocProvider(
                create: (_) => getIt<CreateJourneyCubit>(),
                child: CreateJourneyScreen()),
          ),
        ],
      );
}
