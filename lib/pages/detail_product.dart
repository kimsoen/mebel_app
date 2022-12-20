import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mebel_app/theme.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  List image = [
    'assets/kursi.png',
    'assets/kursi1.png',
    'assets/kursi.png',
  ];

  int currenIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget indokator(int index) {
      return Container(
        height: 4,
        width: currenIndex == index ? 16 : 4,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              12,
            ),
            color: primaryC),
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        children: [
          CarouselSlider(
            items: image
                .map(
                  (image) => Image.asset(
                    image,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              initialPage: currenIndex,
              onPageChanged: (index, reason) {
                setState(() {
                  currenIndex = index;
                });
              },
            ),
          ),
          const SizedBox(height: 15),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: image.map((e) {
                index++;
                return indokator(index);
              }).toList()),
          const SizedBox(
            height: 40,
          )
        ],
      );
    }

    Widget content() {
      return Container(
        padding: const EdgeInsets.only(top: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(
              30,
            ),
          ),
          color: backgroundC1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "KURSI RUANG TAU",
                    style: primarytextstyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    "Rp.200.000",
                    style: pricetextstyle.copyWith(
                        fontSize: 20, fontWeight: semiBold),
                  )
                ],
              ),
            ),

            //Profil Toko
            Container(
              height: 80,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: backgroundC4,
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      // border: Border.all(
                      //   width: 2,
                      //   color: primaryColor,
                      // ),
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                        image: AssetImage("assets/image_splash.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          "NAMA TOKO",
                          style: primarytextstyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "444 produk",
                          style: secondarytextstyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.all(10),
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      "kunjungi toko",
                      style: primarytextstyle,
                    )),
                  )
                ],
              ),
            ),
            // deskripsi
            Container(
              height: 157,
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Deskripsi",
                      style: primarytextstyle.copyWith(
                          fontWeight: semiBold, fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                      style: secondarytextstyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            // Chackout
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 54,
                    width: 200,
                    decoration: BoxDecoration(
                      color: primaryC,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "BUY NOW",
                        style: primarytextstyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 54,
                    width: 54,
                    decoration: BoxDecoration(
                      color: primaryC,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.shopping_cart_outlined),
                  )
                ],
              ),
            ),
            SizedBox(height: 19),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundC6,
      body: SafeArea(
        child: Column(
          children: [
            header(),
            content(),
          ],
        ),
      ),
    );
  }
}
