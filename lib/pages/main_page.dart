import 'package:flutter/material.dart';
import 'package:mebel_app/pages/home_page.dart';
import 'package:mebel_app/pages/second_page.dart';
import 'package:mebel_app/pages/setting_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

int currenIndex = 1;

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    Widget pages() {
      switch (currenIndex) {
        case 0:
          return const SecondPage();
        case 1:
          return const HomePage();
        case 2:
          return const SettingPage();
        default:
          return const HomePage();
      }
    }

    Widget customnavbar() {
      return BottomNavigationBar(
        selectedItemColor: Colors.green,
        currentIndex: currenIndex,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/menu.png",
                width: 25,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset("assets/home.png", width: 25), label: ""),
          BottomNavigationBarItem(
              icon: Image.asset("assets/search.png", width: 25), label: ""),
        ],
        onTap: (value) {
          setState(() {
            currenIndex = value;
          });
        },
      );
    }

    return Scaffold(
      bottomNavigationBar: customnavbar(),
      body: pages(),
    );
  }
}
