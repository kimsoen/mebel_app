import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mebel_app/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailProduk extends StatefulWidget {
  final String gambar;
  final String name;
  final String price;
  final String alamat;

  const DetailProduk({
    super.key,
    required this.gambar,
    required this.name,
    required this.price,
    required this.alamat,
  });

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  void _openWhatsapp(String phoneNumber) async {
    _openDeeplink(
        "whatsapp://send?phone=$phoneNumber&text=Halo Technical Support Sipman, saya ingin konsultasi seputar aplikasi Sippman");
  }

  void _openDeeplink(String url) async {
    // ignore: deprecated_member_use
    if (await launchUrl(Uri.parse(url))) {
      // ignore: deprecated_member_use
      await launch(url, forceSafariVC: false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Whatsapp tidak ter-install",
            style: primarytextstyle.copyWith()),
        backgroundColor: Colors.red,
      ));
    }
  }

  int currenIndex = 0;

  @override
  Widget build(BuildContext context) {
    List image = [
      widget.gambar,
      widget.gambar,
      widget.gambar,
    ];

    Widget indokator(int index) {
      return Container(
        height: 4,
        width: currenIndex == index ? 16 : 4,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              12,
            ),
            color: backgroundC6),
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                items: image
                    .map(
                      (image) => Image.network(
                        image,
                        // width: 300,
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
                    viewportFraction: 1,
                    aspectRatio: 16 / 12),
              ),
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
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: backgroundC2),
                        child: Icon(
                          Icons.chevron_left,
                          color: backgroundC6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 230),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: image.map((e) {
                      index++;
                      return indokator(index);
                    }).toList()),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 20,
          // )
        ],
      );
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 250),
        padding: const EdgeInsets.only(top: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(
              20,
            ),
          ),
          color: backgroundC1,
        ),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Rp. ${widget.price}",
                    style: pricetextstyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
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
                    width: 60,
                    height: 60,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        "NAMA TOKO",
                        style: primarytextstyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "444 produk",
                        style: secondarytextstyle,
                      )
                    ],
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
                  const SizedBox(height: 5),
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
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 20,
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
                        Expanded(
                          child: SizedBox(
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
                              onPressed: () {
                                _openWhatsapp("+62895402042000");
                              },
                              child: Text(
                                "Whatsapp",
                                style: primarytextstyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: semiBold,
                                ),
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
        child: Stack(
          children: [
            header(),
            content(),
          ],
        ),
      ),
    );
  }
}
