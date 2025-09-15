import 'package:food_khan/widget/screens/home/featured.dart';
import 'package:flutter/material.dart';

Widget FeaturedRestaurantModel() {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: [
        Fetured(Color(0xffD0F1EB), Image.asset('lib/asset/image/1.png',fit: BoxFit.cover,)),
        Fetured(Color(0xffD0F1EB), Image.asset('lib/asset/image/taco.png',fit: BoxFit.cover,)),
        Fetured(Color(0xffD0F1EB), Image.asset('lib/asset/image/grill.png',fit: BoxFit.cover,)),
      ],
    ),
  );
}