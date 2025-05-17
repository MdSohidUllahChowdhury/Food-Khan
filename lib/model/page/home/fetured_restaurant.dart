import 'package:Food_Khan/widget/page/home/featured.dart';
import 'package:flutter/material.dart';

Widget FeaturedRestaurantModel() {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: [
        Fetured(Color(0xffD0F1EB), Image.asset('lib/asset/image/taco.png')),
        Fetured(Color(0xffD0F1EB), Image.asset('lib/asset/image/grill.png')),
      ],
    ),
  );
}