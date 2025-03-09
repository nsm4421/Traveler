import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:module/shared/shared.export.dart';

import '../../router/router_config.dart';

part 'state.dart';

@injectable
class HomeBottomNavCubit extends Cubit<HomeBottomNavState> with LoggerMixIn{
  HomeBottomNavCubit(@factoryParam this._navigationShell) : super(HomeBottomNavState());

  final StatefulNavigationShell _navigationShell;

  void handleIndex(int index) {
    final nav = HomeBottomNav.values[index];
    if (nav != state.nav) {
      _navigationShell.goBranch(index);
      emit(state.copyWith(nav: nav));
    }
  }

  void switchIsVisible(bool isVisible) {
    if (state.isVisible != isVisible) {
      emit(state.copyWith(isVisible: isVisible));
    }
  }
}
