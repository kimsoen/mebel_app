import 'package:flutter/material.dart';
import 'package:mebel_app/theme.dart';
import 'package:mebel_app/widget/card_kategori.dart';
import 'package:mebel_app/widget/card_product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "HALO....",
              style: primarytextstyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            Text(
              "find modern furniture For your home..",
              style: secondarytextstyle.copyWith(fontSize: 14),
            )
          ],
        ),
      );
    }

    Widget banner() {
      return Container(
        margin: const EdgeInsets.all(30),
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
              image: AssetImage(
                'assets/banner2.jpg',
              ),
              fit: BoxFit.cover),
        ),
      );
    }

    Widget kategoritext() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          "Kategori",
          style: textStyleColor.copyWith(fontSize: 18, fontWeight: semiBold),
        ),
      );
    }

    Widget categori() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              CardCategori(
                bgImage: true,
                imagUrl: "assets/kursi.png",
                textK: "kursi",
              ),
              CardCategori(
                bgImage: false,
                imagUrl: "assets/kursi1.png",
                textK: "Lumba lumba",
              ),
              CardCategori(
                bgImage: true,
                imagUrl: "assets/kursi.png",
                textK: "kursi",
              ),
              CardCategori(
                bgImage: false,
                imagUrl: "assets/kursi1.png",
                textK: "kursi",
              ),
            ],
          ),
        ),
      );
    }

    Widget textProduct() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Text(
          "Product",
          style: textStyleColor.copyWith(fontSize: 18, fontWeight: semiBold),
        ),
      );
    }

    Widget listproduct() {
      return Column(
        children: const [
          CardProduct(),
          CardProduct(),
          CardProduct(),
          CardProduct(),
          CardProduct(),
          CardProduct(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroudColor,
      // appBar: header(),
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            banner(),
            kategoritext(),
            categori(),
            textProduct(),
            listproduct(),
          ],
        ),
      ),
    );
  }
}
