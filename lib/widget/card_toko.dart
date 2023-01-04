import 'package:flutter/material.dart';
import 'package:mebel_app/theme.dart';

// class CardProduct extends StatelessWidget {
//   const CardProduct({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, "/detail-product");
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         decoration: BoxDecoration(
//           color: backgroundC5,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Image.asset(
//               "assets/kursi1.png",
//               width: 110,
//             ),
//             Text(
//               "Lemari kaca- ruang tamu",
//               style: primarytextstyle.copyWith(
//                 fontSize: 16,
//                 fontWeight: semiBold,
//               ),
//             ),
//             Text(
//               "200.000",
//               style: pricetextstyle.copyWith(fontSize: 16),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class CardProduct extends StatelessWidget {
  const CardProduct(
      {super.key,
      required this.image,
      required this.title,
      required this.harga});

  final String image;
  final String title;
  final String harga;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
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
                image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
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
    );
  }
}
