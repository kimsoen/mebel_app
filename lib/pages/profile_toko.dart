import 'package:flutter/material.dart';
import 'package:mebel_app/theme.dart';

class ProfileToko extends StatelessWidget {
  const ProfileToko({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100, bottom: 20),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: backgroundC1,
              image: const DecorationImage(
                image: AssetImage(
                  "assets/image_splash.png",
                ),
              ),
            ),
          ),
          Text(
            "TOKO MEBEL AMBU",
            style: titletextstyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      );
    }

    Widget dtailprofile() {
      return Column(
        children: [
          Divider(
            thickness: 1,
            color: backgroundC1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: const Icon(
                  Icons.apps_sharp,
                  size: 30,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: const Icon(
                  Icons.favorite,
                  size: 30,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: const Icon(
                  Icons.kayaking_outlined,
                  size: 30,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: backgroundC1,
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundC6,
      body: Column(
        children: [
          header(),
          dtailprofile(),
        ],
      ),
    );
  }
}
