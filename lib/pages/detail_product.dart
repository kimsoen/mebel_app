import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mebel_app/theme.dart';

class DetailProduct extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String price;
  final String alamat;

  const DetailProduct({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.alamat,
  });

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
          Container(
            margin: const EdgeInsets.only(
              top: 30,
              left: 30,
              right: 30,
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.chevron_left,
                  ),
                ),
                const Icon(
                  Icons.shopping_bag,
                )
              ],
            ),
          ),
          CarouselSlider(
            items: image
                .map(
                  (image) => Image.asset(
                    image,
                    width: 270,
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
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: image.map((e) {
                index++;
                return indokator(index);
              }).toList()),
          const SizedBox(
            height: 20,
          )
        ],
      );
    }

    Widget content() {
      return Container(
        padding: const EdgeInsets.only(top: 20),
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
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: primarytextstyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    "${widget.price} 200.000",
                    style: pricetextstyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
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
                        image: AssetImage(
                          "assets/image_splash.png",
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        Text(
                          "nama toko",
                          style: primarytextstyle.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "total product",
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
                      style: primarytextstyle.copyWith(fontSize: 11),
                    )),
                  )
                ],
              ),
            ),

            // deskripsi
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deskripsi",
                    style: primarytextstyle.copyWith(
                        fontWeight: semiBold, fontSize: 14),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                    style: secondarytextstyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Alamat",
                    style: primarytextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.alamat,
                    style: secondarytextstyle.copyWith(
                      fontSize: 12,
                    ),
                  ),

                  // Chackout
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: primaryC,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.shopping_cart_rounded,
                            size: 35,
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          height: 54,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: primaryC,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  12,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "BUY NOW",
                              style: primarytextstyle.copyWith(
                                fontSize: 18,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundC6,
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
