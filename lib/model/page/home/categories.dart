import 'package:Food_Khan/widget/page/home/card_chips.dart';
import 'package:flutter/material.dart';

Widget CategoriModel() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      cardChips(
        Color(0xffF5D4C1),
        Image.asset('lib/asset/image/pizza.png', cacheHeight: 40),
      ),
      cardChips(
        Color(0xffD0F1EB),
        Image.asset('lib/asset/image/salad.png', cacheHeight: 40),
      ),
      cardChips(
        Color(0xffC9EAFD),
        Image.asset('lib/asset/image/burger.png', cacheHeight: 40),
      ),
    ],
  );
}