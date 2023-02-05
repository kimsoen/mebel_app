import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mebel_app/pages/home_page.dart';
import 'package:mebel_app/pages/main_page.dart';
import 'package:mebel_app/pages/profile_toko.dart';
import 'package:mebel_app/pages/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      // "/detail-product": (context) => const DetailProduct(),
      "/profil-toko": (context) => const ProfileToko(),
    });
  }
}
