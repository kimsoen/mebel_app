import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mebel_app/pages/home_page.dart';
import 'package:mebel_app/pages/second_page.dart';
import 'package:mebel_app/pages/setting_page.dart';
import 'package:mebel_app/theme.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _navBarState();
}

int _currentIndex = 1;

class _navBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    Widget pages() {
      switch (_currentIndex) {
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

    Widget customNavbar() {
      return CustomNavigationBar(
        iconSize: 30.0,
        selectedColor: const Color(0xff040307),
        strokeColor: const Color(0x30040307),
        unSelectedColor: const Color(0xffacacac),
        backgroundColor: backgroundC2,
        items: [
          CustomNavigationBarItem(
            icon: const Image(
              image: AssetImage(
                "assets/menu.png",
              ),
            ),
          ),
          CustomNavigationBarItem(
            icon: const Image(
              image: AssetImage(
                "assets/home.png",
              ),
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.lightbulb_outline),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      );
    }

    return Scaffold(
      bottomNavigationBar: customNavbar(),
      body: pages(),
    );
  }
}
