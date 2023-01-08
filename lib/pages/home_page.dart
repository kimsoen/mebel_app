import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mebel_app/theme.dart';
import 'package:mebel_app/widget/card_kategori.dart';
import 'package:mebel_app/widget/card_toko.dart';

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
      return FutureBuilder<QuerySnapshot<Object?>>(
          future: featured.get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<QueryDocumentSnapshot<Object?>> data = snapshot.data!.docs;
              return GridView.builder(
                  padding: const EdgeInsets.all(10),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 2 / 3),
                  itemBuilder: (context, index) {
                    Map<String, dynamic> dataFeatured =
                        data[index].data() as Map<String, dynamic>;

                    return CardProduct(
                      gambar: "${dataFeatured['gambar']}",
                      harga: '${dataFeatured['harga']}',
                      title: '${dataFeatured['title']}',
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
