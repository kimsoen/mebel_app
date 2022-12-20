import 'package:flutter/material.dart';
import 'package:mebel_app/pages/detail_product.dart';
import 'package:mebel_app/pages/home_page.dart';
import 'package:mebel_app/pages/main_page.dart';
import 'package:mebel_app/pages/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      "/": (context) => const SplashPage(),
      "/navbar-page": (context) => const NavBar(),
      "/home-page": (context) => const HomePage(),
      "/detail-product": (context) => const DetailProduct(),
    });
  }
}
