part of 'p_home.dart';

class HomeBottomNavWidget extends StatelessWidget {
  const HomeBottomNavWidget(this._navigationShell, {super.key});

  final StatefulNavigationShell _navigationShell;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBottomNavCubit, HomeBottomNavState>(
        builder: (context, state) {
      return state.isVisible
          ? BottomNavigationBar(
              onTap: (int idx) {
                if (idx != _navigationShell.currentIndex) {
                  _navigationShell.goBranch(
                    idx,
                    initialLocation: idx == _navigationShell.currentIndex,
                  );
                  context.read<HomeBottomNavCubit>().handleIndex(idx);
                }
              },
              currentIndex: _navigationShell.currentIndex,
              elevation: 0,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              selectedItemColor: context.colorScheme.primary,
              unselectedItemColor: Colors.blueGrey,
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
