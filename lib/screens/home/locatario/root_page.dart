import 'package:flutter/material.dart';
import 'package:locapp/screens/home/home.dart';
import 'package:locapp/screens/home/locatario/home_locatario.dart';
import 'package:locapp/screens/location/reserva/user_schedule.dart';
import 'package:locapp/screens/profile/locador/user_profile.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:locapp/screens/profile/locatario/info_conta/user_locador_perfil.dart'; 

class RootPageLocatario extends StatefulWidget {
  const RootPageLocatario({super.key});

  @override
  State<RootPageLocatario> createState() => _RootPageState();
}

class _RootPageState extends State<RootPageLocatario> {
  int _bottomNavIndex = 0;

  // Lista de páginas
  List<Widget> pages = const [
    HomeLocatario(),
    UserLocadorPerfil(),
  ];

  // Lista de icons das páginas
  List<IconData> iconList = [
    Icons.home,
    Icons.person,
  ];

  // Lista dos títulos das páginas
  List<String> titleList = [
    'Home',
    'Perfil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      body: IndexedStack(
        index: _bottomNavIndex,
        children: pages,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: 70,
        elevation: 0,
        splashColor:  Theme.of(context).colorScheme.primary.withOpacity(.9),
        activeColor:  Theme.of(context).colorScheme.primary.withOpacity(.9),
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        backgroundColor: Theme.of(context).colorScheme.surface,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index){
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}