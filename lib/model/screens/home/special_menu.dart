import 'package:food_khan/widget/screens/home/card_menu.dart';
import 'package:flutter/material.dart';

Widget SpecialMenuModel() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        cardMenu(
          Color(0xffF5D4C1),
          Image.asset('lib/asset/image/taco.png'),
          '   The Taco\n   Company',
          '4.8',
          ' 20% off',
          ' Maxican'
        ),
        cardMenu(
          Color(0xffDED2F9),
          Image.asset('lib/asset/image/pic_03.png', cacheHeight: 137),
          '   The Nodules \n   Club',
          '5.0',
          ' 25% off',
          ' American'
        ),
        cardMenu(
          Color(0xffD0F1EB),
          Image.asset('lib/asset/image/pic_01.png'),
          '   Fast Restaurant',
          '4.7',
          ' 15% off',
          ' Italian'
        ),
        cardMenu(
          Color(0xffD0F1EB),
          Image.asset('lib/asset/image/pic_03.png',cacheHeight: 160,),
          '   Chicken House',
          '4.9',
          ' 17% off',
          ' Turkish'
        ),
      ],
    ),
  );
}
