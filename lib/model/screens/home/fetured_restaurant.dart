import 'package:food_khan/widget/screens/home/featured.dart';
import 'package:flutter/material.dart';

Widget FeaturedRestaurantModel() {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: [
        Fetured(Color(0xffD0F1EB), Image.asset('lib/asset/image/featured_restaurant/pic_01.png',fit: BoxFit.cover,)),
        Fetured(Color(0xffD0F1EB), Image.asset('lib/asset/image/featured_restaurant/pic_02.png',fit: BoxFit.cover,)),
        Fetured(Color(0xffD0F1EB), Image.asset('lib/asset/image/featured_restaurant/pic_03.png',fit: BoxFit.cover,)),
      ],
    ),
  );
}