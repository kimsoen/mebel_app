import 'package:flutter/material.dart';
import 'package:mebel_app/theme.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 30, left: 20),
        child: Text(
          "INFORMASI",
          style: primarytextstyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget content() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "mebel app adalah sebuah aplikasi yang menampilkan sebuah produk furniture / interios sebuah bangunan, aplikasi ini dibuat dengan tujuan mengelola data toko mabel yang ada di kecamatan tamansari untuk kemajuan di bidang industri dengan mengimplementasikan smart city.",
              style: primarytextstyle,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "DESIGN :",
              style: primarytextstyle.copyWith(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "figma",
                style: primarytextstyle,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Assets :",
              style: primarytextstyle.copyWith(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: "Figma \n",
                    style: primarytextstyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: "Flaticon \n",
                    style: primarytextstyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: "google",
                    style: primarytextstyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundC1,
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
