import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mebel_app/pages/detail_produk.dart';
import 'package:mebel_app/theme.dart';
import 'package:mebel_app/widget/card_kategori.dart';
import 'package:mebel_app/widget/card_product.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference featured = firestore.collection('featured');

    Future<DocumentSnapshot> getproduct(String id) async {
      return await featured.doc().get();
    }

    Future<List<Map<String, dynamic>>> getProducts() async {
      final url = Uri.parse('http://192.168.18.5:8000/api/products');
      var headers = {'Content-Type': 'application/json'};
      var response = await http.get(url, headers: headers);
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body)['data'];
        List<Map<String, dynamic>> products = [];

        for (var item in data) {
          products.add(item);
        }

        return products;
      } else {
        throw Exception('Gagal Get Products!');
      }
    }

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
        margin: const EdgeInsets.all(20),
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
              image: AssetImage(
                'assets/banner.jpg',
              ),
              fit: BoxFit.cover),
        ),
      );
    }

    Widget kategoritext() {
      return Container(
        margin: const EdgeInsets.only(bottom: 10, left: 20),
        child: Text(
          "Kategori",
          style: textStyleColor.copyWith(fontSize: 18, fontWeight: semiBold),
        ),
      );
    }

    Widget categori() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/detail-product");
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
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
        ),
      );
    }

    Widget textProduct() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          "Featured",
          style: textStyleColor.copyWith(fontSize: 18, fontWeight: semiBold),
        ),
      );
    }

    Widget listCardProduct() {
      return FutureBuilder<List<Map<String, dynamic>>>(
          future: getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<Map<String, dynamic>> listProduct = snapshot.data!;
              return GridView.builder(
                  padding: const EdgeInsets.all(10),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listProduct.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 2 / 3),
                  itemBuilder: (context, index) {
                    Map<String, dynamic> dataFeatured = listProduct[index];
                    return CardProduct(
                      gambar: "${dataFeatured['gambar']}",
                      harga: 'Rp. ${dataFeatured['harga']}',
                      title: '${dataFeatured['nama']}',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailProduk(
                                gambar: dataFeatured["gambar"],
                                name: dataFeatured["nama"],
                                price: dataFeatured["harga"],
                                alamat: dataFeatured["alamat"],
                              ),
                            ));
                      },
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
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
            listCardProduct(),
          ],
        ),
      ),
    );
  }
}
