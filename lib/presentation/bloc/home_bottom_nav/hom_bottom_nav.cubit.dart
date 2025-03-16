import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:module/shared/shared.export.dart';

part 'home_bottom_nav.state.dart';

@lazySingleton
class HomeBottomNavCubit extends Cubit<HomeBottomNavState> with LoggerMixIn {
  HomeBottomNavCubit() : super(HomeBottomNavState());

  void handleIndex(int index) {
    final nav = HomeBottomNav.values[index];
    if (nav != state.nav) {
      emit(state.copyWith(nav: nav));
    }
  }

  void switchIsVisible(bool isVisible) {
    if (state.isVisible != isVisible) {
      emit(state.copyWith(isVisible: isVisible));
    }
  }
}
