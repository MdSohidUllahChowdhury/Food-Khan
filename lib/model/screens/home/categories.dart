import 'package:food_khan/widget/screens/home/categori_chips.dart';
import 'package:flutter/material.dart';

Widget CategoriModel() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        categorieChips(
          Color(0xffF5D4C1),
          Image.asset('lib/asset/image/category/pizza.png', cacheHeight: 40),
          'Pizza'
        ),
        categorieChips(
          Color(0xffD0F1EB),
          Image.asset('lib/asset/image/category/salad.png', cacheHeight: 40),
          'Soup'
        ),
        categorieChips(
          Color(0xffC9EAFD),
          Image.asset('lib/asset/image/category/burger.png', cacheHeight: 40),
          'Burger'
        ),
        categorieChips(
          Color(0xffD0F1EB),
          Image.asset('lib/asset/image/category/salad.png', cacheHeight: 40),
          'Soup'
        ),
        categorieChips(
          Color(0xffF5D4C1),
          Image.asset('lib/asset/image/category/pizza.png', cacheHeight: 40),
          'Pizza'
        ),
      ],
    ),
  );
}