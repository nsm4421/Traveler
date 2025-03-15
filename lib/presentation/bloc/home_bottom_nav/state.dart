part of 'cubit.dart';

enum HomeBottomNav {
  home(
      label: "HOME",
      iconData: Icons.home_outlined,
      activeIconData: Icons.home_filled),
  myTrip(
      label: 'MyTrip',
      iconData: Icons.airplane_ticket_outlined,
      activeIconData: Icons.airplane_ticket),
  setting(
      label: 'Setting',
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

  HomeBottomNavState({this.nav = HomeBottomNav.home, this.isVisible = true});

  HomeBottomNavState copyWith({HomeBottomNav? nav, bool? isVisible}) {
    return HomeBottomNavState(
        nav: nav ?? this.nav, isVisible: isVisible ?? this.isVisible);
  }
}
