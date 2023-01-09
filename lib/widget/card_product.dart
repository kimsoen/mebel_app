import 'package:flutter/material.dart';
import 'package:mebel_app/model/featured_model.dart';
import 'package:mebel_app/theme.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
    required this.gambar,
    required this.onTap,
    required this.title,
    required this.harga,
    // required this.feturedModel
  });

  final String gambar;
  final String title;
  final String harga;
  final Function() onTap;
  // final FeturedModel feturedModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: backgroundC3,
          //menambahkan bayangan
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 130,
                decoration: BoxDecoration(
                  color: backgroundC6,
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: backgroundC6, width: 5),
                  image: DecorationImage(
                    image: NetworkImage(
                      gambar,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  title,
                  style: primarytextstyle.copyWith(
                      fontWeight: semiBold, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  harga,
                  style: pricetextstyle.copyWith(fontWeight: semiBold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
