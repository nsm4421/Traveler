part of 'hom_bottom_nav.cubit.dart';

enum HomeBottomNav {
  displayReview(
      label: "HOME",
      iconData: Icons.home_outlined,
      activeIconData: Icons.home_filled),
  displayTripPlan(label: "TRIP", iconData: Icons.map_outlined, activeIconData: Icons.map),
  search(
      label: 'SEARCH',
      iconData: Icons.search_outlined,
      activeIconData: Icons.search),
  setting(
      label: 'SETTING',
      iconData: Icons.settings_outlined,
      activeIconData: Icons.settings);

  final IconData iconData;
  final IconData activeIconData;
  final String label;

  const HomeBottomNav(
      {required this.iconData,
      required this.activeIconData,
      required this.label});
}

class HomeBottomNavState {
  final HomeBottomNav nav;
  final bool isVisible;

  HomeBottomNavState(
      {this.nav = HomeBottomNav.displayReview, this.isVisible = true});

  HomeBottomNavState copyWith({HomeBottomNav? nav, bool? isVisible}) {
    return HomeBottomNavState(
        nav: nav ?? this.nav, isVisible: isVisible ?? this.isVisible);
  }
}
