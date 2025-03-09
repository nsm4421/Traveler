import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home_bottom_nav/cubit.dart';

class HomeBottomNavWidget extends StatelessWidget {
  const HomeBottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBottomNavCubit, HomeBottomNavState>(
        builder: (context, state) {
      return state.isVisible
          ? BottomNavigationBar(
              onTap: context.read<HomeBottomNavCubit>().handleIndex,
              currentIndex: state.nav.index,
              elevation: 0,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: HomeBottomNav.values
                  .map(
                    (item) => BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      label: item.label,
                      icon: Icon(
                        item.iconData,
                      ),
                      activeIcon: Icon(
                        item.activeIconData,
                      ),
                    ),
                  )
                  .toList(),
            )
          : const SizedBox.shrink();
    });
  }
}
