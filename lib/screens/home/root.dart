import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:locapp/screens/home/home.dart';
import 'package:locapp/screens/location/reserva/user-history.dart';
import 'package:locapp/screens/profile/user_profile.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
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
    Icons.history,
    Icons.person,
  ];

  // Lista dos títulos das páginas
  List<String> titleList = [
    'Início',
    'Histórico',
    'Usuário',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleList[_bottomNavIndex], style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),),
            const Icon(Icons.notifications, color: Colors.black54, size: 30.0,),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),

      // Corpo do App
      body: IndexedStack(
        index: _bottomNavIndex,
        children: pages,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Barra de navegação
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: 70,
        elevation: 0,
        splashColor: Theme.of(context).colorScheme.primary.withOpacity(.9),
        activeColor: Theme.of(context).colorScheme.primary.withOpacity(.9),
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(.1),
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}