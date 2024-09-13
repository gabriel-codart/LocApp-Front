import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:locapp_front/screens/home/home.dart';
import 'package:locapp_front/screens/location/reserva/user-history.dart';
import 'package:locapp_front/screens/profile/user_profile.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _bottomNavIndex = 0;

  // Lista de páginas
  List<Widget> pages = const [
    HomePage(),
    UserHistory(),
    UserProfile(),
  ];

  // Lista de icons das páginas
  List<IconData> iconList = [
    Icons.home,
    Icons.pending_actions,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      height: 70,
      elevation: 0,
      splashColor: Theme.of(context).colorScheme.primary.withOpacity(.9),
      activeColor: Theme.of(context).colorScheme.primary.withOpacity(.9),
      inactiveColor: Colors.black.withOpacity(.5),
      icons: iconList,
      backgroundColor: Theme.of(context).colorScheme.surface,
      activeIndex: _bottomNavIndex,
      gapLocation: GapLocation.none,
      notchSmoothness: NotchSmoothness.softEdge,
      onTap: (index) {
        setState(() {
          _bottomNavIndex = index;
        });
      },
  );
  }
}
