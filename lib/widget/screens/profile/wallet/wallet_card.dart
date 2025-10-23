import 'package:food_khan/widget/screens/profile/wallet/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

Widget CardWallet() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Swiper(
      itemWidth: 300,
      itemHeight: 240,
      loop: true,
      duration: 600,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(cardImagePath[index])),
            borderRadius: BorderRadius.circular(20),
          ),
        );
      },
      itemCount: cardImagePath.length,
      layout: SwiperLayout.STACK,
    ),
  );
}
