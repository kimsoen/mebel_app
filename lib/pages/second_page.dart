import 'package:flutter/material.dart';
import 'package:mebel_app/theme.dart';
import 'package:mebel_app/widget/card_category.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          "KATEGORI",
          style: primarytextstyle.copyWith(fontSize: 22),
        ),
      );
    }

    Widget content() {
      return Column(
        children: const [
          CardCategory(
            imageUrl: "assets/category_decorate.png",
            title: 'DEKORASI',
          ),
          CardCategory(
            imageUrl: "assets/category_lighting.png",
            title: 'Lightting',
          ),
          CardCategory(
            imageUrl: "assets/category_furniture.png",
            title: 'Furniture',
          ),
          CardCategory(
            imageUrl: "assets/category_kitchen.png",
            title: 'Kitchen',
          ),
          CardCategory(
            imageUrl: "assets/category_bad.png",
            title: 'bed & beth ',
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundC1,
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            content(),
          ],
        ),
      ),
    );
  }
}
