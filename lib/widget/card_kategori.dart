import 'package:flutter/material.dart';
import 'package:mebel_app/theme.dart';

class CardCategori extends StatelessWidget {
  const CardCategori(
      {super.key,
      required this.imagUrl,
      this.bgImage = false,
      required this.textK});

  final String imagUrl;
  final bool bgImage;
  final String textK;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.only(left: 8),
      height: 50,
      decoration: BoxDecoration(
        color: bgImage ? backgroundC1 : backgroundC5,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            textK,
            style:
                primarytextstyle.copyWith(fontWeight: semiBold, fontSize: 15),
          ),
          Image.asset(imagUrl)
        ],
      ),
    );
  }
}
