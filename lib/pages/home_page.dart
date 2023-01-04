import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mebel_app/model/fetured_model.dart';
import 'package:mebel_app/theme.dart';
import 'package:mebel_app/widget/card_kategori.dart';
import 'package:mebel_app/widget/card_toko.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference featured = firestore.collection('featured');

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

                    FeturedModel feturedModel =
                        FeturedModel.fromJson(dataFeatured);
                    // manual
                    // return CardProduct(
                    //   harga: "${dataFeatured['harga']} 2.000.000",
                    //   image: "${dataFeatured['gambar']}",
                    //   title: "${dataFeatured['title']}",
                    // );

                    // Pakai Model
                    return CardProduct(
                      feturedModel: feturedModel,
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
